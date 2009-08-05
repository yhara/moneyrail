class LogsController < ApplicationController

  def edit
    @year, @month = params[:year].to_i, params[:month].to_i

    first_day = Date.new(@year, @month)
    @month_range = first_day .. ((first_day >> 1) - 1)

    @accounts = Account.all(:order => "position")
    @categories = Category.hashed
    @cat_all = [
      @categories[:expense],
      @categories[:income],
      @categories[:move],
    ].flatten(1)
  end

end
