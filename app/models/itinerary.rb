class Itinerary < ActiveRecord::Base
  attr_accessible :name, :Flights
  has_many :Travelers
  has_many :Flights

	validates :name, :presence => true

  has_many :flights
end
