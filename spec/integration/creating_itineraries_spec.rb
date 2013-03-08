require 'spec_helper'

feature 'Create Itineraries' do
  scenario "can create an itinerary" do
    visit '/itineraries'
    click_link 'New Itinerary'
    page.should have_content('New Itinerary')
    fill_in 'Name', :with => 'Family Vacation'
    click_button 'Create Itinerary'
    page.should have_content('Itinerary has been created.')

    itinerary = Itinerary.find_by_name("Family Vacation")
    page.current_url.should == itinerary_url(itinerary)
    title = "Family Vacation - Itineraries - OSO"
    find("title").should have_content(title)
  end
end
