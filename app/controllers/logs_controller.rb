class LogsController < ApplicationController

  def edit
    @year, @month = params[:year].to_i, params[:month].to_i

    first_day = Date.new(@year, @month)
    @month_range = first_day .. ((first_day >> 1) - 1)

    @accounts = Account.find(:all)
    @categories = Category.hashed
  end

end
