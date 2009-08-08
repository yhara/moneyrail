module LogsHelper

  # returns [Date(2009/8/1), nil, nil, Income, ..]
  def make_table_data(account)
    condition = {
      :conditions => {:date => @month_range},
    }
    items = [
      account.expenses.all(condition),
      account.incomes.all(condition),
      account.moves_from.all(condition),
      account.moves_to.all(condition),
    ].flatten(1)

    @month_range.map{|today|
      todays, items = items.partition{|m| m.date == today}
      positions = todays.map(&:position)
      max_position = (positions.empty?) ? 0 : positions.max

      (0..max_position).map{|i|
        day = (i==0) ? today : :no_date
        [
          today,
          @cat_all.map{|cat|
            todays.find{|m| m.category == cat && m.position == i}
          }.unshift(day)
        ]
      }
    }.compact.flatten(1)
  end

end
