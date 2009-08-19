module LogsHelper

  def cell(value)
    if @mode == :edit
      "<input type='text' value='#{h value}' />"
    else
      "<div>#{h value}</div>"
    end
  end

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
          i,
          i == max_position, 
          @cat_all.map{|cat|
            todays.find{|m| m.category == cat && m.position == i}
          }.unshift(day)
        ]
      }
    }.flatten(1)
  end

end
