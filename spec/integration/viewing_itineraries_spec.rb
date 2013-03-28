require 'spec_helper'

feature "Viewing itineraries" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:other_user) { Factory(:user_confirmed) }
  let!(:other_user_2) { Factory(:user_confirmed) }
  let!(:itinerary_1) { Factory(:itinerary, :name => "Family Vacation", :user => user) }
  let!(:itinerary_2) { Factory(:itinerary, :name => "Christmas Vacation", :user => user) }
  let!(:flight_1) { Factory(:flight, :itinerary => itinerary_1) }
  let!(:flight_2) { Factory(:flight, :itinerary => itinerary_2) }
  let!(:other_itinerary) { Factory(:itinerary, :name => "Not your trip", :user => other_user) }

  before do

  end

  scenario "Listing all itineraries" do
    sign_in_as!(user)
    visit '/'
    page.should have_content(itinerary_1.name)
    page.should have_content(itinerary_2.name)
    page.should_not have_content("Not your trip")
    click_link itinerary_2.name
    page.current_url.should == itinerary_url(itinerary_2)
  end

  scenario "No itineraries to list" do
    sign_in_as!(other_user_2)
    visit '/'
    page.should have_content("Nothing here!")
  end
end
