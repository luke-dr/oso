require 'spec_helper'

feature "Viewing Travelers" do
  #TODO create and sign in as an admin user
  let(:user) { Factory.create(:user) }

  scenario "can show all user information" do
    visit '/users'
    click_link "Traveler, Mike"
    page.should have_content("Mike Traveler")
    page.should have_content(user.email)
  end
end
