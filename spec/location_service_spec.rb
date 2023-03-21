require 'rails_helper'

RSpec.describe LocationService, type: :service do
  describe "#get_country_code" do
    it "returns the country code for a valid IP address" do
      country_code = LocationService.get_country_code("8.8.8.8")
      expect(country_code).to eq("US")
    end

    it "returns a default country code for an invalid IP address" do
      country_code = LocationService.get_country_code("invalid")
      expect(country_code).to eq(LocationService::DEFAULT_COUNTRY_CODE)
    end
  end
end


