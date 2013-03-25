require 'spec_helper'

feature 'Creating Users' do
  let(:user) { Factory.build(:user) }
  let!(:admin) { Factory(:admin_user) }

  before do
    visit '/admin'
    sign_in_as!(admin)
    click_link "Manage User Accounts"
    click_link "Create User Account"
  end

  scenario "can create a new user" do
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "password"
    click_button 'Submit'
    page.should have_content("User account created.")
  end

  scenario "cannot create a user without an email or password" do
    click_button "Submit"
    page.should have_content("Email can't be blank")
    page.should have_content("Password can't be blank")
  end
end


