require 'uri'

class DelayListsController < ApplicationController
  def index
    url_str = request.url
    parsed_url = URI.parse(url_str)
    query_array = URI::decode_www_form(parsed_url.query)
    query_hash = Hash[query_array]
    puts query_hash

    @region = query_hash.fetch("region")

    routes = TrainRoute.new
    delay_lists = routes.fetchRoutes()
    # TODO 無限ループに陥る原因を調査する
    routes.setRoutes(delay_lists)
    filtered_routes = routes.filterRoutes(@region)
    puts filtered_routes
  end
end
