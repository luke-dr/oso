class Traveler < ActiveRecord::Base
  attr_accessible :Itineraries, :email, :name, :Flights
  has_many :Itineraries
  has_many :Flights, :through => :Itineraries

  validates :name, :email, :presence => true
end
