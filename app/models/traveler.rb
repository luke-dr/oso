class Traveler < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  has_many :Itineraries
  has_many :Flights

  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true
end
