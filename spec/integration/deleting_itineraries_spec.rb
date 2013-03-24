require 'spec_helper'

feature "Deleting itineraries" do
  scenario "Deleting an itinerary" do
    Factory(:itinerary, :name => "Family Vacation")
    visit '/'
    click_link "Family Vacation"
    click_link "Delete Itinerary"
    visit "/itineraries"
    page.should_not have_content("Family Vacation")
  end

end
