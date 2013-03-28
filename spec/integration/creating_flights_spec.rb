  require 'spec_helper'

feature "Creating flights" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:itinerary) { Factory(:itinerary, :user => user) }
  let!(:flight_1) { Factory(:flight, :itinerary => itinerary) }
  let(:flight_2)  { Factory(:flight) }

  before do
    sign_in_as!(user)
    visit "/"
    click_link itinerary.name
    click_link "Add a Flight"
  end

  scenario "User can add a flight to an existing itinerary" do
    fill_in "Airline code", :with => flight_2.airline_code
    fill_in "Flight number", :with => flight_2.flight_number

    select  '2015', :from =>'flight_scheduled_departure_time_1i'
    select  'March', :from =>'flight_scheduled_departure_time_2i'
    select  '27', :from =>'flight_scheduled_departure_time_3i'

    fill_in "Departure airport", :with => flight_2.departure_airport
    fill_in "Arrival airport", :with => flight_2.arrival_airport

    click_button "Create Flight"

    page.current_path.should == itinerary_path(itinerary)
    page.should have_content ("Mar 27 2015")
    page.should have_content flight_1.departure_airport
    page.should have_content flight_2.departure_airport
  end
end
