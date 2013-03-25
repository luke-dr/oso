class Itinerary < ActiveRecord::Base
  attr_accessible :name, :flights_attributes
  has_many :Travelers
  has_many :flights
  
  accepts_nested_attributes_for :flights
  
  belongs_to :user

	validates :name, :presence => true
end
