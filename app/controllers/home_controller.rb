class HomeController < ApplicationController
  def top
    route_instance = TrainRoute.new
    if route_instance.getRoutes().empty? then
      route_instance.setRoutes()
    end
  end

  def about
  end
end
