require 'uri'

class DelayListsController < ApplicationController
  def index
    url_str = request.url
    parsed_url = URI.parse(url_str)
    query_array = URI::decode_www_form(parsed_url.query)
    query_hash = Hash[query_array]
    puts query_hash

    @region = query_hash.fetch("region")
  end
end
