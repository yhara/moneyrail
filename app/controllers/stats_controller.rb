class StatsController < ApplicationController
  def show
    year = params[:year].to_i
    month = params[:month].to_i

    @month = Date.new(year, month)
    @month_range = @month .. ((@month >> 1) - 1)

    @categories = Category.hashed.values_at(:expense, :income).flatten(1)

    @stat = make_stats
  end

  private

  #           Expense            Income
  #      cat1 cat2 cat3 cat4   cat5 cat6
  # acc1   99   99   99   0      0    33
  # acc2   12   34  567   8      9     0
  # ------------------------------------
  # sum    
  def make_stats
    items = Item.all(:conditions => {:date => @month_range, :type => ["Expense", "Income"]}).group_by(&:category)

    accounts = Account.all(:order => "position")

    rows = accounts.map{|account|
      make_stat_row(account, items)
    }

    return rows.push make_sum_row(rows)
  end

  def make_stat_row(account, items)
    row = @categories.map{|category|
      if items[category]
        items[category].
          find_all{|item| item.account == account}.
          map{|item| item.amount}.
          sum
      else
        0
      end
    }
    row.unshift(account.name)
  end

  def make_sum_row(rows)
    rows.transpose.map{|cells|
      if cells.first.class == String
        ""
      else
        cells.sum
      end
    }
  end
end
