require 'spec_helper'

feature "Editing Airlines" do
  before do
    Factory(:airline, :name => "Virgin America")
    visit "/airlines"
    click_link "Virgin America"
    click_link "Edit Airline"
  end

  scenario "Updating an airline" do
    fill_in "Name", :with => "Virgin Airlines"
    fill_in 'airline_icao_code', :with => 'VRD'
    fill_in 'AOC Number', :with => 'VQIA199L'
    fill_in 'URL', :with => 'http://www.virginamerica.com'
    fill_in 'Phone', :with => '555-555-5555'
    click_button "Update Airline"
    page.should have_content("Airline has been updated.")
  end

  scenario "Updating an airline with invalid attributes is bad" do
    fill_in "Name", :with => ""
    fill_in 'airline_icao_code', :with => ""
    fill_in 'AOC Number', :with => ""
    fill_in 'URL', :with => ""
    fill_in 'Phone', :with => ""
    click_button "Update Airline"
    page.should have_content("Airline has not been updated.")
  end

end
