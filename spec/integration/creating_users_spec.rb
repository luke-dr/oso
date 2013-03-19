require 'spec_helper'

feature 'Creating Users' do
  user = Factory.build(:user)

  before do
    visit '/users'
    click_link 'Create User Profile'
  end

  scenario "can create a new user" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Submit'
    page.should have_content('user profile created.')
  end

  scenario "cannot create a user without information, name optional" do
    click_button "Submit"
    page.should_not have_content("First name can't be blank")
    page.should_not have_content("Last name can't be blank")
    page.should have_content("Email can't be blank")
    page.should have_content("Password can't be blank")
  end
end


