require 'spec_helper'

feature 'Creating Travelers' do
  before do
    visit '/travelers'
    click_link 'Create Traveler Profile'
  end

  scenario "can create a new traveler" do
    fill_in 'Name', :with => 'Greg'
    fill_in 'Email', :with => 'greg@greg.biz'
    click_button 'Save'
    page.should have_content('Traveler profile created.')
  end

  scenario "cannot create a traveler without information" do
    click_button 'Save'
    page.should have_content("Name can't be blank")
    page.should have_content("Email can't be blank")
  end
end


