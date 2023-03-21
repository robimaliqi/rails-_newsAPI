require 'open-uri'
require 'json'

class NewsService
  API_KEY = ENV['API_KEY']
  BASE_URL = "https://gnews.io/api/v4/search"
  MAX_RESULTS = 10

  def self.search(query, country_code)
    url = build_url(query, country_code)
    response = fetch_data(url)
    JSON.parse(response)['articles']
  end

  def self.build_url(query, country_code)
    user_input = URI.encode_www_form_component(query)
    "#{BASE_URL}?q=#{user_input}&lang=en&country=#{country_code}&max=#{MAX_RESULTS}&apikey=#{API_KEY}"
  end

  def self.fetch_data(url)
    URI.open(url).read
  rescue StandardError => e
    puts "Failed to fetch data from GNews API: #{e.message}"
    []
  end
end