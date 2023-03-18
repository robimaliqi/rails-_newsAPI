require 'open-uri'
require 'json'
require 'geocoder'

class NewsController < ApplicationController

  public

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
    url = "https://gnews.io/api/v4/search?q=#{URI.encode_www_form_component(query)}&lang=en&country=#{@country_code}&max=10&apikey=#{ENV['API_KEY']}"
    news_serialized = URI.open(url).read
    JSON.parse(news_serialized)["articles"]
  end  

  def set_location
    location = request.location
    @country_code = location.country_code
  end
end

