class HomeController < ApplicationController
  def top
    routes = TrainRoute.new
    routes.setRoutes()
  end

  def about
  end
end
