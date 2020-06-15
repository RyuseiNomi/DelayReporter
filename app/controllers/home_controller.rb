class HomeController < ApplicationController
  def top
    routes = TrainRoute.new
    routes.setRoutes()
  end
end
