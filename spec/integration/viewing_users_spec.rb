require 'spec_helper'

feature "Viewing User Profile" do
  let!(:user) { Factory(:user_confirmed) }

  scenario "can show user their profile" do
    sign_in_as!(user)
    visit '/'
    click_link "Account"
    page.should have_content(user.name)
    page.should have_content(user.email)
    page.should have_content("Delete My Account")
  end
end
