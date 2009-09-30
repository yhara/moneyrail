class LogsController < ApplicationController

  def view
    # param
    @mode = params[:mode]
    @year, @month = params[:year].to_i, params[:month].to_i

    # date
    @current_month = Date.new(@year, @month)
    @month_range = @current_month .. ((@current_month >> 1) - 1)

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
