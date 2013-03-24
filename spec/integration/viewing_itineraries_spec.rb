require 'spec_helper'

feature "Viewing itineraries" do
  scenario "Listing all itineraries" do
   itinerary = Factory.create(:itinerary, :name => "Family Vacation")
   visit '/itineraries'
   click_link itinerary.name
   page.current_url.should == itinerary_url(itinerary)
  end
end
