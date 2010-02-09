class StatsController < ApplicationController

  def month
    year = params[:year].to_i
    month = params[:month].to_i

    @month = Date.new(year, month)

    @stat = make_month_stats(@month)
  end

  def year
    year = params[:year].to_i

    @year = Date.new(year)

    @stat = make_year_stats(@year)
  end

  private

  def month_range(month)
    month.beginning_of_month .. month.end_of_month
  end

  #  -        Expense                Income
  #  -   cat1 cat2 cat3 cat4 sum  cat5 cat6 sum
  # acc1   99   99   99   0   x     0    33   y
  # acc2   12   34  567   8   x     9     0   y
  # ------------------------------------
  # sum    
  def make_month_stats(month)
    rows = Account.all(:order => "position").map{|account|
      items = Item.all(:conditions => {
        :account_id => account.id,
        :date => month_range(month), 
        :type => ["Expense", "Income"]
      }).group_by(&:category)

      make_row(account.name, items)
    }

    return rows.push make_sum_row(rows)
  end

  #   -       Expense            Income
  # month    cat1 cat2 cat3 cat4   cat5 cat6
  # 200901   99   99   99   0      0    33
  # 200902   12   34  567   8      9     0
  # ------------------------------------
  # sum    
  def make_year_stats(year)
    rows = (0...12).map{|m| 
      month = year >> m

      items = Item.all(:conditions => {
        :date => month_range(month),
        :type => ["Expense", "Income"]
      }).group_by(&:category)

      make_row(month, items)
    }

    return rows.push make_sum_row(rows)
  end

  def make_row(header, items)
    expenses = Category.expenses.map{|category|
      (items[category] || []).map(&:amount).sum
    }
    incomes = Category.incomes.map{|category|
      (items[category] || []).map(&:amount).sum
    }

    [header] + 
    expenses +
    [expenses.sum] +
    incomes +
    [incomes.sum]
  end

  def make_sum_row(rows)
    rows.transpose.map{|cells|
      if cells.first.is_a? Numeric
        cells.sum
      else
        "sum"
      end
    }
  end
end
