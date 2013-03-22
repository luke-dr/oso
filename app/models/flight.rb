class Flight < ActiveRecord::Base
  attr_accessible :actual_departure_time, :actual_departure_time, :airline_code, :arrival_airport, :departure_airport, :flight_number, :scheduled_arrival_time, :scheduled_departure_time, :status

  has_many :flights
end
