class LogsController < ApplicationController

  def edit
    @year, @month = params[:year], params[:month]
    @accounts = Account.find(:all)
    @categories = Category.sorted
  end

end
