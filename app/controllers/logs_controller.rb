class LogsController < ApplicationController

  def edit
    @value = "#{params[:month]} #{params[:year]}"
  end

end
