FactoryGirl.define do
  factory :flight do
    airline_code "AA"
    flight_number "5"
    departure_airport "DFW"
    arrival_airport "Sea"
    scheduled_departure_time  "2013-03-27 00:00:0000"
    itinerary
  end
end
