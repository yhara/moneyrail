class HomeController < ApplicationController

  def index
    @months = []
    collect_months(@months)
    append_current_month(@months)
  end

  private

  def collect_months(months)
    oldest = Item.minimum("date")
    newest = Item.maximum("date")

    if oldest and newest
      m = newest.beginning_of_month
      while m >= oldest.beginning_of_month
        months.push m
        m <<= 1
      end
    end
  end

  def append_current_month(months)
    current = Time.now.to_date.beginning_of_month
    unless months.include?(current)
      months.push current
    end
  end

end
