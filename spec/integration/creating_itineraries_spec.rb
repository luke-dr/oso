require 'spec_helper'

feature 'Create Itineraries - ' do
  let!(:user) { Factory(:user_confirmed) }

  before do
    visit '/'
    sign_in_as!(user)
    click_link 'Create an itinerary'
    page.should have_content('New Itinerary')
  end

  scenario "Can create an itinerary w/o flight" do
    fill_in 'Name', :with => 'Family Vacation'
    click_button 'Save Itinerary'
    page.should have_content('Itinerary has been created.')

    itinerary = Itinerary.find_by_name("Family Vacation")
    page.current_url.should == itinerary_url(itinerary)
    title = "Family Vacation - Itineraries - OSO"
    find("title").should have_content(title)
  end

  scenario "Can NOT create an itinerary with no name" do
    click_button 'Save Itinerary'
    page.should have_content("Itinerary has not been created.")
    page.should have_content("Name can't be blank")
  end

  scenario "Can create and itinerary with flight" do
    fill_in 'Name', :with => "Jayml's family vacation"
    fill_in 'Airline code', :with => "AA"
    fill_in 'Flight number', :with => "5"
    select  '2013', :from =>'itinerary_flights_attributes_0_scheduled_departure_time_1i'
    select  'March', :from =>'itinerary_flights_attributes_0_scheduled_departure_time_2i'
    select  '27', :from =>'itinerary_flights_attributes_0_scheduled_departure_time_3i'
    fill_in 'Departure airport', :with => "DFW"
    fill_in 'Arrival airport', :with => "Sea"
    click_button "Save Itinerary"
    page.should have_content("Jayml's family vacation")
    page.should have_content("AA")
    page.should have_content("5")
  end
end
