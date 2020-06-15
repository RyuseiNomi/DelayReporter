class SearchController < ApplicationController
  def index
    station_name = self.extractStationNameFromQuery()
    routes = TrainRoute.new
    @results = routes.findStationByName(station_name)
  end

  # リクエストURLよりクエリパラメータを取得する
  # ==== Return
  # name :: 駅名
  private def extractStationNameFromQuery
    url_str = request.url
    parsed_url = URI.parse(url_str)
    query_array = URI::decode_www_form(parsed_url.query)
    query_hash = Hash[query_array]
    return query_hash.fetch("station_name")
  end
end
