class Itinerary < ActiveRecord::Base
  attr_accessible :name, :Flights
  has_many :Travelers
  has_many :Flights
end
