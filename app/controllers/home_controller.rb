class HomeController < ApplicationController
  def top
    routes = TrainRoute.new
    @delay_lists = routes.fetchRoutes()
    routes.setRoutes(@delay_lists)
  end
end
