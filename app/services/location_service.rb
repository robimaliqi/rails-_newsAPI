require 'geocoder'

class LocationService

  def self.get_country_code(request)
    location = request.location
    if location.present? && location.country_code.present?
      location.country_code
    else
      'gb'
    end
  end
end