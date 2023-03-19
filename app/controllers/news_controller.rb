require 'open-uri'
require 'json'
require 'geocoder'


class NewsController < ApplicationController

  API_KEY = ENV['API_KEY']
  URL     = "https://gnews.io/api/v4/search?q=%<query>s&lang=en&country=%<country>s&max=10&apikey=#{API_KEY}"

  public
  def initialize
    @articles = []
  end

  def index
    @articles = fetch_articles('example')
  end

  def search
    search_query = params[:q]
    @articles = fetch_articles(search_query)
    render :index
  end

  private

  def fetch_articles(query)
    user_input = URI.encode_www_form_component(query)
    url_search = URL % {query: user_input, country: @country_code}
    news_serialized = URI.open(url_search).read
    JSON.parse(news_serialized)["articles"]
  end  

  def set_location
    location = request.location
    @country_code = location.country_code
  end
end

