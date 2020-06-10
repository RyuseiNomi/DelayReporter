require 'net/http'
require 'json'

class HomeController < ApplicationController
  def top
    #TODO 遅延リスト取得処理を別のクラスに定義する
    delay_list_api_url = "https://8wbb81dkpd.execute-api.ap-northeast-1.amazonaws.com/beta/delayList?region=all"
    @delay_lists = []

    uri = URI.parse(delay_list_api_url)
    response_json = Net::HTTP.get(uri)
    hashed_delay_lists = JSON.parse(response_json)
    train_routes = hashed_delay_lists.fetch("delay_list")

    train_routes.each do |train_route|
        @delay_lists.push train_route
    end
  end
end
