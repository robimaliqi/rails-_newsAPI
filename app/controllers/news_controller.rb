class NewsController < ApplicationController
  require 'open-uri'
  require 'json'

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
    url = "https://gnews.io/api/v4/search?q=#{URI.encode_www_form_component(query)}&lang=en&country=gb&max=10&apikey=#{ENV['API_KEY']}"
    news_serialized = URI.open(url).read
    JSON.parse(news_serialized)["articles"]
  end  
end

