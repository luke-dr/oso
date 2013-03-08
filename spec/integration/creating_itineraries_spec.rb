require 'spec_helper'

feature 'Create Itineraries' do
  scenario "can create an itinerary" do
    visit '/itineraries'
    click_link 'New Itinerary'
    page.should have_content('New Itinerary')
    fill_in 'Name', :with => 'Family Vacation'
    click_button 'Create Itinerary'
    page.should have_content('Itinerary has been created.')
  end
end
