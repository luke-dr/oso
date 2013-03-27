require 'spec_helper'

feature "Creating flights" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:itinerary) { Factory(:itinerary, :user => user) }
  let!(:flight_1) { Factory(:flight, :itinerary => itinerary) }

  before do
    sign_in_as!(user)
    visit "/"
    click_link itinerary.name
    within (".flight_id_#{flight_1.id}") do
      click_link "View Details and Alternatives"
    end
  end

  scenario "User can check details and alternative flights" do
    page.current_path.should == itinerary_flight_path(itinerary, flight_1)
    page.should have_content flight_1.departure_airport
    page.should have_content flight_1.departure_airport
  end
end
