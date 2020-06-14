require 'net/http'
require 'json'

class TrainRoute
  @@routes_property = []

  # APIから遅延リストを取得する
  # ==== Return
  # delay_lists :: 遅延リスト
  def fetchRoutes
    delay_list_api_url = "https://8wbb81dkpd.execute-api.ap-northeast-1.amazonaws.com/beta/delayList?region=all"
    delay_lists = []

    uri = URI.parse(delay_list_api_url)
    response_json = Net::HTTP.get(uri)
    hashed_delay_lists = JSON.parse(response_json)
    train_routes = hashed_delay_lists.fetch("delay_list")

    train_routes.each do |train_route|
        delay_lists.push train_route
    end
  end

  # 列車運行情報配列を取得する
  # ==== Return
  # routes :: 遅延リスト
  def getRoutes
    return @routes_property
  end

  # APIから取得した列車運行情報をプロパティ変数に格納する
  # ==== Args
  # routes :: 遅延リスト
  def setRoutes(routes)
    routes.each do |route|
      @@routes_property.push route
    end
  end

  # APIから取得した列車運行情報をプロパティ変数に格納する
  # ==== Args
  # routes :: 地域名
  # ==== Return
  # filtered_routes :: 地域名でフィルターされた遅延リスト
  def filterRoutes(region)
    filtered_routes = []
    @@routes_property.each do |route|
      if route.fetch("Region") == region then
        filtered_routes.push route
      end
    end

    return filtered_routes
  end
end
