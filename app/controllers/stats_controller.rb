class StatsController < ApplicationController
  include ApplicationHelper

  def month
    year = params[:year].to_i
    month = params[:month].to_i

    @month = Date.new(year, month)
    @month_range = @month .. ((@month >> 1) - 1)

    @categories = Category.hashed.values_at(:expense, :income).flatten(1)

    @stat = make_month_stats
  end

  def year
    year = params[:year].to_i

    @year = Date.new(year)

    @categories = Category.hashed.values_at(:expense, :income).flatten(1)

    @stat = make_year_stats(year)
  end

  private

  def month_range(month)
    month.beginning_of_month .. month.end_of_month
  end

  #           Expense            Income
  #      cat1 cat2 cat3 cat4   cat5 cat6
  # acc1   99   99   99   0      0    33
  # acc2   12   34  567   8      9     0
  # ------------------------------------
  # sum    
  def make_month_stats
    make_stat_row = lambda{|account, items|
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
    }
    make_sum_row = lambda{|rows|
      rows.transpose.map{|cells|
        if cells.first.class == String
          "sum"
        else
          cells.sum
        end
      }
    }

    items = Item.all(:conditions => {:date => @month_range, :type => ["Expense", "Income"]}).group_by(&:category)

    accounts = Account.all(:order => "position")

    rows = accounts.map{|account|
      make_stat_row.call(account, items)
    }

    return rows.push make_sum_row.call(rows)
  end

  #           Expense            Income
  #        cat1 cat2 cat3 cat4   cat5 cat6
  # 200901   99   99   99   0      0    33
  # 200902   12   34  567   8      9     0
  # ------------------------------------
  # sum    
  def make_year_stats(year)
    make_row = lambda{|month, items|
      row = @categories.map{|category|
        if items[category]
          items[category].
            map{|item| item.amount}.
            sum
        else
          0
        end
      }
      row.unshift(format_month(month))
    }
    make_sum_row = lambda{|rows|
      rows.transpose.map{|cells|
        if cells.first.class == String
          "sum"
        else
          cells.sum
        end
      }
    }

    rows = (1..12).map{|m| 
      month = Date.new(year, m)

      items = Item.all(:conditions => {
        :date => month_range(month),
        :type => ["Expense", "Income"]
      }).group_by(&:category)

      make_row.call(month, items)
    }

    return rows.push make_sum_row.call(rows)
  end
end
