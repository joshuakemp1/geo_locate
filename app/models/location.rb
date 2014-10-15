class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  @client = GooglePlaces::Client.new("AIzaSyAGox1xvhPcFrrTxJkBXhR69Ws_s7eZ8fI")
  @spotList = @client.spots(-33.8670522, 151.1957362)
end
