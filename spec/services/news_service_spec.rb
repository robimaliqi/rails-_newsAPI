require 'rails_helper'

RSpec.describe NewsService, type: :service do
  describe "#search" do
    it "returns an array of articles" do
      articles = NewsService.search("technology", "GB")
      expect(articles).to be_an(Array)
      expect(articles.length).to be >= 1
    end

    it "returns an empty array for an invalid query" do
      articles = NewsService.search("", "")
      expect(articles).to eq([])
    end
  end
end