class HomeController < ApplicationController
  def index
    @reading = Reading.last
    current_hour = Time.now.hour
    current_day_of_year = Time.now.yday

    if current_day_of_year == @reading.date.yday + 1 and current_hour >= 17
      Reading.update_db
      @reading = Reading.last
    end
  end
end
