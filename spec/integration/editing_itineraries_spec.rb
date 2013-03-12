require 'spec_helper'

feature "Editing Itineraries" do
  before do
    Factory(:itinerary, :name => "Family Vacation")
    visit '/itineraries'
    click_link "Family Vacation"
    click_link "Edit Itinerary"
  end

  scenario "Updating an itinerary" do
    fill_in "Name", :with => "Family Vacation beta"
    click_button "Update Itinerary"
    page.should have_content("Itinerary has been updated.")
  end

  scenario "Updating an itinerary with invalid attributes is bad" do
    fill_in "Name", :with => ""
    click_button "Update Itinerary"
    page.should have_content("Itinerary has not been updated.")
  end

end
