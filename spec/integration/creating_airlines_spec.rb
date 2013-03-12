require 'spec_helper'

feature 'Creating Airlines' do
  before do
    visit '/airlines'
    click_link 'New Airline'
  end

  scenario "can create an airline" do
    fill_in 'Name', :with => 'Virgin America'
    fill_in 'airline_icao_code', :with => 'VRD'
    fill_in 'AOC Number', :with => 'VQIA199L'
    fill_in 'URL', :with => 'http://www.virginamerica.com'
    fill_in 'Phone', :with => '555-555-5555'
    click_button 'Create Airline'
    page.should have_content('Airline has been added')

    airline = Airline.find_by_name("Virgin America")
    page.current_url.should == airline_url(airline)
    title = "Virgin America - Airlines - OSO"
    find("title").should have_content(title)
  end

  scenario "can not create an airline without information" do
    click_button 'Create Airline'
    page.should have_content("Airline has not been created.")
    page.should have_content("Name can't be blank")

  end

end
