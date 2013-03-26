require 'rubygems'
require 'nokogiri'
require 'open-uri'

feature "Check flight status" do
  let!(:user) { Factory(:user_confirmed) }

  before do
    visit '/'
    sign_in_as!(user)
    click_link 'Create an itinerary'
    page.should have_content('New Itinerary')
  end

  scenario "Can create and itinerary with flight" do
    fill_in 'Name', :with => "Jayml's family vacation"
    fill_in 'Airline code', :with => "AA"
    fill_in 'Flight number', :with => "5"
    fill_in 'Flight date', :with => '5/20/2013'
    fill_in 'Departure airport', :with => "DFW"
    fill_in 'Arrival airport', :with => "Sea"
    click_button "Save Itinerary"
    page.should have_content("Jayml's family vacation")
    page.should have_content("AA")
    page.should have_content("5")
  end

end
