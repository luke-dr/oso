class Itinerary < ActiveRecord::Base
  attr_accessible :name
  has_many :travelers

	validates :name, :presence => true
end
