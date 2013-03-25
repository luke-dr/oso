require 'spec_helper'

feature "Editing Itineraries" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:itinerary) { Factory(:itinerary, :name => "Family Vacation", :user => user) }

  before do
    sign_in_as!(user)
    visit '/'
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
