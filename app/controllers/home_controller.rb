class HomeController < ApplicationController
  def index
    @reading = Reading.last
  end
end
