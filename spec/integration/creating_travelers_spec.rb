require 'spec_helper'

feature 'Creating Travelers' do

  before do
    visit '/travelers'
    click_link 'Create Traveler Profile'
  end

  scenario "can create a new traveler" do
    fill_in 'First name', :with => traveler.first_name
    fill_in 'Last name', :with => traveler.last_name
    fill_in 'Email', :with => traveler.email
    click_button 'Submit'
    page.should have_content('Traveler profile created.')
  end

  scenario "cannot create a traveler without information" do
    click_button 'Submit'
    page.should have_content("First name can't be blank")
    page.should have_content("Last name can't be blank")
    page.should have_content("Email can't be blank")
  end
end


