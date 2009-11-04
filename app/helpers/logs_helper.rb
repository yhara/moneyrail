module LogsHelper

  def link_to_edit_or_show(str, month)
    if @mode == :edit
      link_to_edit_logs str, month
    else
      link_to_show_logs str, month
    end
  end

  def cell(value)
    if @mode == :edit
      "<input type='text' value='#{h value}' />"
    else
      "<div>#{h value}</div>"
    end
  end

  def account_select_tag(selected_account=nil)
    options = options_from_collection_for_select(@accounts, 'id', 'name',
                                                 selected_account.try(:id))
    select_tag "",
      "<option value='none'>--</option>" + options
  end

  # returns [Date(2009/8/1), nil, nil, Income, ..]
  def make_table_data(account)
    condition = {
      :conditions => {:date => @month_range},
    }
    items = account.expenses.all(condition) +
            account.incomes.all(condition)

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

  def make_moves_data
    moves = Move.all(:conditions => {:date => @month_range})

    @month_range.map{|today|
      todays, moves = moves.partition{|m| m.date == today}
      positions = todays.map(&:position)
      max_position = (positions.empty?) ? 0 : positions.max

      (0..max_position).map{|i|
        day = (i==0) ? today : :no_date
        [
          today,
          i,
          i == max_position,
          [day, moves.find{|m| m.position == i}]
        ]
      }
    }.flatten(1)
  end

end
