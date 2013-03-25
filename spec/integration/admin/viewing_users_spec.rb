require 'spec_helper'

feature "Viewing Travelers" do
  let!(:admin)  { Factory(:admin_user) }
  let!(:user_1) { Factory(:user) }
  let!(:user_2) { Factory(:user) }

  before do
    sign_in_as!(admin)
    visit '/admin'
    click_link "Manage User Accounts"
  end

  scenario "can show all user information" do
    page.should have_content(user_1.email)
    page.should have_content(user_2.email)
  end

  scenario "can view specific user information" do
    click_link user_1.email
    page.should have_content(user_1.name)
    page.should have_content(user_1.email)
    page.should have_content(user_1.itineraries.length)
  end
end
