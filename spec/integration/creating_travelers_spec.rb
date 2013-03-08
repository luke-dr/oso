require 'spec_helper'

feature 'Creating Travelers' do
  before do
    visit '/'
    click 'New Traveler'
  end

scenario "can create a new traveler" do
  fill_in 'Name', :with => 'Greg'
  fill_in 'Email', :with => 'greg@greg.biz'
  click_button 'Save'
  page.should have_content('Welcome to OSO')
end

  scenario "cannot create a traveler without information" do
    click_button 'Save'
    page.should have_content("You need a name.")
    page.should have_content("You need an email.")
  end
end


