class HomeController < ApplicationController
  def top
    @delay_lists = ["路線A", "路線B"]
  end
end
