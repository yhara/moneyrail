module LogsHelper

  # returns [Date(2009/8/1), nil, nil, Income, ..]
  def make_table_data(account)
    cat_all = Category.sorted

    condition = {
      :conditions => {:date => @month_range},
      #:order => "date, index_of_day",
    }
    items = [
      account.expenses.all(condition),
      account.incomes.all(condition),
      account.moves_from.all(condition),
      account.moves_to.all(condition),
    ].flatten(1)

    @month_range.map{|today|
      todays, items = items.partition{|m| m.date == today}
      if todays.empty?
        nil
      else
        max_index = todays.map(&:index_of_day).max

        (0..max_index).map{|i|
          cat_all.map{|cat|
            todays.find{|m| m.category == cat && m.index_of_day == i}
          }.unshift(today)
        }
      end
    }.compact.flatten(1)
  end

end
