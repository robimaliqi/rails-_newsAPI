require 'json'
require 'open-uri'

class NewsController < ApplicationController

  def index
    url = "https://gnews.io/api/v4/search?q=example&lang=en&country=gb&max=10&apikey=#{ENV['API_KEY']}"

    news_serialized = URI.open(url).read
    @articles = JSON.parse(news_serialized)["articles"]
  end
end
