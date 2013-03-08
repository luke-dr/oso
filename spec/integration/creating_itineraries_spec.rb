require 'spec_helper'

feature 'Create Itineraries' do
  scenario "can create an itinerary" do
    visit '/itineraries'
    click_link 'New Itinerary'
    page.should have_content('New Itinerary')
    fill_in 'Itinerary Name', :with => 'Family Vacation'
    fill_in 'Airline Code', :with => 'AA'
    fill_in 'Flight Number', :with => '123'
    click_button 'Create Itinerary'
  end
end
