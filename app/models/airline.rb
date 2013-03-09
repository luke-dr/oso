class Airline < ActiveRecord::Base
  attr_accessible :aoc_number, :icao_code, :name, :phone, :url
end
