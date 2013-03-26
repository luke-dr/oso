require 'spec_helper'

feature "Editing users" do
  let!(:user) do
    Factory(:user_confirmed,
      name: "Sarah Connor",
      email: "sarah@connor.co.uk")
  end
  let!(:gary) { Factory(:user, :email => "gary@busey.net") }

  before do
    sign_in_as!(user)
    visit "/"
    click_link "Account"
  end

  scenario "user can change their name, email, and password" do
    click_link "Edit Contact Information"
    fill_in "Name", with: "Ethan Allen"
    fill_in "Email", with: "ethan@allen.net"

    click_button "Submit"

    page.should have_content("Ethan Allen")
    page.should have_content("ethan@allen.net")
    page.should have_content("Your contact information has been updated!")
    page.should have_content("Make sure to confirm your new email!")
  end

  scenario "can NOT submit blank email, blank name okay" do
    click_link "Edit Contact Information"
    fill_in "Name", with: nil
    fill_in "Email", with: nil
    click_button "Submit"
    page.should have_content("No changes saved!")
  end

  scenario "can NOT change stored email to one already in the DB" do
    click_link "Edit Contact Information"
    fill_in "Email", with: "gary@busey.net"
  end

#  scenario "user can change their password" do
#  end
end
