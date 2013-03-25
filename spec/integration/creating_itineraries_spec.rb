require 'spec_helper'

feature 'Create Itineraries' do
  before do
    visit '/'
    click_link 'Create an itinerary'
    page.should have_content('New Itinerary')
  end

  scenario "can create an itinerary" do
    fill_in 'Name', :with => 'Family Vacation'
    click_button 'Create Itinerary'
    page.should have_content('Itinerary has been created.')

    itinerary = Itinerary.find_by_name("Family Vacation")
    page.current_url.should == itinerary_url(itinerary)
    title = "Family Vacation - Itineraries - OSO"
    find("title").should have_content(title)
  end

  scenario "Can NOT create an itinerary without a name" do
    click_button 'Create Itinerary'
    page.should have_content("Itinerary has not been created.")
    page.should have_content("Name can't be blank")
  end
end
