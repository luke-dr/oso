class Airline < ActiveRecord::Base
  #attr_accessible :aoc_number, :icao_code, :name, :phone, :url
  attr_accessible :name, :icao_code, :aoc_number, :url, :phone
  validates :name, :icao_code, :aoc_number, :url, :phone, :presence => true
  #validates :aoc_number, :icao_code, :name, :phone, :url, :presence => true
end
