module LogsHelper

  # returns [Date(2009/8/1), nil, nil, Income, ..]
  def make_table_data(account)
    cat_all = Category.sorted

    condition = {
      :conditions => {:date => @month_range},
      :order => "date, index_of_day",
    }
    items = [
      account.expenses.all(condition),
      account.incomes.all(condition),
      account.moves_from.all(condition),
      account.moves_to.all(condition),
    ].flatten

    items.map{|item|
      cat_all.map{|cat|
        cat == item.category ? item : nil
      }.unshift(item.date)
    }
  end

end
