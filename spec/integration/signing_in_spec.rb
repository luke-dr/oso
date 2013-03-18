require 'spec_helper'

feature "Signing in" do
  scenario 'Signing in via form' do
    User.find_by_email('user@oso.com')
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "user@oso.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
