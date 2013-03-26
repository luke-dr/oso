require 'spec_helper'

feature "Signing up" do
  let(:user) { Factory.build(:user) }

  scenario "Successful signup through sign up link" do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content("A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
  end

  #scenario "Successful sign up with itinerary already created"
end
