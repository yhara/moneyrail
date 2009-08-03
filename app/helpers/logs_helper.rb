module LogsHelper
  # [Date(2009/8/1), nil, nil
  def make_table_data(account, categories)
    cat_all = [:expense, :income, :move].map{|kind|
      categories[kind]
    }.flatten

    items = [
      account.expenses,
      account.incomes,
      account.moves_from,
      account.moves_to,
    ].flatten
#    items = cat_all.map{|cat|
#      cat.kind_class.find(:all, :conditions => {:category_id => cat.id})
#        # FIXME: Date check
#    }.flatten

    items.map{|item|
      cat_all.map{|cat|
        cat == item.category ? item : nil
      }.unshift(item.date)
    }
  end

end
