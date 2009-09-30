class LogsController < ApplicationController

  def view
    # param
    @mode = params[:mode]
    @year, @month = params[:year].to_i, params[:month].to_i

    # date
    first_day = Date.new(@year, @month)
    @month_range = first_day .. ((first_day >> 1) - 1)
    @current_month = first_day
    @prev_month = first_day << 1
    @next_month = first_day >> 1

    # items
    @accounts = Account.all(:order => "position")
    @categories = Category.hashed
    @cat_all = [
      @categories[:expense],
      @categories[:income],
      @categories[:move],
    ].flatten(1)
  end
  attr_reader :mode

end
