require_relative '../services/news_service'
require_relative '../services/location_service'

class NewsController < ApplicationController
  def index
    @articles = NewsService.search('news', LocationService.get_country_code(request))
  end

  def search
    search_query = params[:q]
    if search_query.blank?
      flash[:error] = "Please enter a search query."
      redirect_to root_path
    else
      @articles = NewsService.search(search_query, LocationService.get_country_code(request))
      render :index
    end
  end
end

