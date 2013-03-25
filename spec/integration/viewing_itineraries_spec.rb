require 'spec_helper'

feature "Viewing itineraries" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:other_user) { Factory(:user_confirmed) }
  let!(:itinerary_1) { Factory(:itinerary, :name => "Family Vacation", :user => user) }
  let!(:itinerary_2) { Factory(:itinerary, :name => "Christmas Vacation", :user => user) }
  let!(:other_itinerary) { Factory(:itinerary, :name => "Not your trip", :user => other_user) }

  before do
    sign_in_as!(user)
    visit '/'
  end

  scenario "Listing all itineraries" do
    page.should have_content("Family Vacation")
    page.should_not have_content("Not your trip")
    click_link itinerary.name
    page.current_url.should == itinerary_url(itinerary_2)
  end
end
