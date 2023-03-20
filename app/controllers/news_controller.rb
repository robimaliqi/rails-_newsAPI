require 'open-uri'
require 'json'
require 'geocoder'


class NewsController < ApplicationController

  API_KEY = ENV['API_KEY']
  URL     = "https://gnews.io/api/v4/search?q=%<query>s&lang=en&country=%<country>s&max=10&apikey=#{API_KEY}"

  def index
    @articles = fetch_articles('news')
  end

  def search
    search_query = params[:q]
    @articles = fetch_articles(search_query)
    render :index
  end

  def fetch_articles(query)
    user_input = URI.encode_www_form_component(query)
    url_search = format(URL, query: user_input, country: request.location.country_code)
    JSON.parse(URI.open(url_search).read)['articles']
  end

