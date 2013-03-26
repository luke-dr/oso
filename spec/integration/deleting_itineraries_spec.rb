require 'spec_helper'

feature "Deleting itineraries" do
  let!(:itinerary) { Factory(:itinerary, :name => "Family Vacation", :user => user) }
  let!(:itinerary_other) { Factory(:itinerary, :user => user) }
  let!(:user) { Factory(:user_confirmed) }

  scenario "Deleting an itinerary" do
    sign_in_as!(user)
    visit '/'
    click_link "Family Vacation"
    click_link "Delete Itinerary"
    visit "/"
    page.should_not have_content("Family Vacation")
    page.should have_content(itinerary_other.name)
  end

end
