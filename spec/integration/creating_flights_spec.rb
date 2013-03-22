require 'spec_helper'

feature "Create flights" do

  before do
    visit "/itineraries"
    click_link "New Itinerary"
  end

  scenario "Can create a flight" do
    fill_in 'Name', :with => "Ivan's Around The World Vacation"
    fill_in "Airline code", :with => "AA"
    fill_in "Flight number", :with => "5"
    fill_in "Departure airport", :with => "DFW"
    fill_in "Arrival airport", :with => "HNL"
    click_button "Save Flight"
    page.should have_content("Ivan's Around The World Vacation")
  end

end

