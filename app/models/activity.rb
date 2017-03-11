class Activity < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :date_nights,
             :dependent => :destroy

  belongs_to :contributor,
             :class_name => "User"

  # Indirect associations

  # Validations
  validates :name, :presence => true
  validates :location, :presence => true
end
