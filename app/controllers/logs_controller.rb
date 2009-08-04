class LogsController < ApplicationController

  def edit
    @year, @month = params[:year].to_i, params[:month].to_i
    @month_range = Range.new(
      Date.new(@year, @month).beginning_of_month,
      Date.new(@year, @month).end_of_month
    )
    @accounts = Account.find(:all)
    @categories = Category.hashed
  end

end
