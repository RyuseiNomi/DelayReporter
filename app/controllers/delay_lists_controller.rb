require 'uri'

class DelayListsController < ApplicationController
  def index
    url_str = request.url
    parsed_url = URI.parse(url_str)
    query_array = URI::decode_www_form(parsed_url.query)
    query_hash = Hash[query_array]
    @region = query_hash.fetch("region")

    routes = TrainRoute.new
    @filtered_routes = routes.filterRoutes(@region)
  end
end
