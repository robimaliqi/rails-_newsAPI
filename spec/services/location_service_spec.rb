require 'rails_helper'

RSpec.describe LocationService, type: :service do
  describe "#get_country_code" do
    it "returns the country code for a valid IP address" do
      request = double('request', location: double('location', country_code: 'GB'))
      country_code = LocationService.get_country_code(request)
      expect(country_code).to eq("GB")
    end

    it "returns a default country code for an invalid IP address" do
      request = double('request', location: nil)
      country_code = LocationService.get_country_code(request)
      expect(country_code).to eq('GB')
    end
  end
end


