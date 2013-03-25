require 'spec_helper'

feature "Deleting users" do
  let!(:user) { Factory(:user_confirmed) }
  let!(:admin) { Factory(:admin_user) }

  before do
    sign_in_as!(admin)
    visit "/admin"
    click_link "Manage User Accounts"
    click_link user.email
  end

  scenario "can remove users from the database" do
    click_link "Delete Account"
    visit "/admin"
    click_link "Manage User Accounts"
    page.should_not have_content(user.email)
  end

end
