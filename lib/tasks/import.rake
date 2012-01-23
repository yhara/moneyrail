desc "Import items FILE=filename"
# Example
#
# (Date      Account Type   Category Amount Title          )
#                           or To
# 2011-04-24 bank    Move   wallet   50000  withdraw
# 2011-04-25 bank    Income sarary   169422 sarary of march
task :import => :environment do
  File.read(ENV["FILE"]).each_line{|line|
    puts "processing: #{line}"

    sp = /\s+/
    if line =~ /\A(\d+-\d+-\d+)#{sp}(\S+)#{sp}(\S+)#{sp}(\S+)#{sp}(-?\d+)#{sp}(.+)/
      _, date, acc, type, cat, amount, title = *Regexp.last_match.to_a
      date = Date.parse(date)
      amount = amount.to_i

      p [date, acc, type, cat, amount, title]

      if x = type.constantize.first(conditions:
                                    {date: date,
                                     amount: amount,
                                     title: title})
        puts "WARN: already exists #{x}"
        puts "Really add this? [y/N]"
        if $stdin.gets.chars.first.downcase != "y"
          puts "skipping."
          next
        end
      end

      item = type.constantize.new(
        title: title,
        amount: amount,
        date: date
      )

      if type == "Move"
        item.account_from = Account.find_by_name(acc)
        item.account_to =   Account.find_by_name(cat)
      else
        item.account = Account.find_by_name(acc)
        item.category = Category.find_by_name(cat)
      end

      pos = item.find_position
      p item.save!
      item.position = pos
      item.save!
      p Item.last
    else
      raise "invaid line: #{line}"
    end
    $stdin.gets
  }
end
