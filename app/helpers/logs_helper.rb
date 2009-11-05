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
  
  def select_cell(acc)
    if @mode == :edit
      account_select_tag(acc)
    else
      "<div>#{h acc.name if acc}</div>"
    end
  end

  def account_select_tag(selected_account=nil)
    options = options_from_collection_for_select(@accounts, 'id', 'name',
                                                 selected_account.try(:id))
    select_tag "",
      "<option value='_none_'>--</option>" + options
  end

  def make_income_expense_data(account)
    items = account.expenses.all(in_month) +
            account.incomes.all(in_month)

    make_table_data(items) do |todays, i|
      @cat_all.map{|cat|
        todays.find{|m| m.category == cat && m.position == i}
      }
    end
  end

  def make_moves_data
    moves = Move.all(in_month)

    make_table_data(moves) do |todays, i|
      [todays.find{|m| m.position == i} || :no_move]
    end
  end

  private

  def in_month
    { :conditions => {:date => @month_range}}
  end

  def make_table_data(items, &row_maker)
    condition = {
      :conditions => {:date => @month_range},
    }

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
          row_maker.call(todays, i).unshift(day)
        ]
      }
    }.flatten(1)
  end

end
