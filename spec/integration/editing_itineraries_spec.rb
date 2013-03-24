require 'spec_helper'

feature "Editing Itineraries - " do
  let!(:itinerary) { Factory(:itinerary) }
  let!(:flight) do
    flight = Factory(:flight, :itinerary => itinerary)
    flight
  end

  before do
    visit '/itineraries'
    click_link itinerary.name
    click_link "Edit Itinerary"
  end

  scenario "Updating an itinerary" do
    fill_in "Name", :with => "Family Vacation beta"
    click_button "Save Itinerary"
    page.should have_content("Itinerary has been updated.")
  end

  scenario "Updating an itinerary with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Save Itinerary"
    page.should have_content("Itinerary has not been updated.")
  end

end
