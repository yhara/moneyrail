class StatsController < ApplicationController
  def show
    year = params[:year].to_i
    month = params[:month].to_i

    @month = Date.new(year, month)
  end
end
