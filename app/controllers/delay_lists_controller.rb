require 'uri'

class DelayListsController < ApplicationController
  def index
    @region = self.extractRegionFromQuery()

    routes = TrainRoute.new
    @filtered_routes = routes.filterRoutes(@region)
  end
  
  # リクエストURLよりクエリパラメータを取得する
  # ==== Return
  # region :: 地方名
  private def extractRegionFromQuery
    url_str = request.url
    parsed_url = URI.parse(url_str)
    query_array = URI::decode_www_form(parsed_url.query)
    query_hash = Hash[query_array]
    return query_hash.fetch("region")
  end
end
