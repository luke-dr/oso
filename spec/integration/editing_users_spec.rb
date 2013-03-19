require 'spec_helper'

#this is an admin feature

feature "Editing users" do
  user = Factory.create(:user,
            first_name: "Sarah",
            last_name: "Connor",
            email: "sarah@connor.co.uk")
  Factory.create(:user, :email => "gary@busey.net")

  before do
    visit '/users'
    click_link "Connor, Sarah"
    click_link "Edit Profile"
  end

  scenario "can change stored email and password" do
    fill_in "First name", with: "Ethan"
    fill_in "Last name", with: "Allen"
    fill_in "Email", with: "ethan@allen.net"
    fill_in "Password", with: user.password
    click_button "Submit"
    page.should have_content("Ethan Allen")
    page.should have_content("ethan@allen.net")
    page.should have_content("User information saved.")
  end

  scenario "can NOT submit with blank fields" do
    fill_in "First name", with: nil
    fill_in "Last name", with: nil
    fill_in "Email", with: nil
    click_button "Submit"
    page.should have_content("No changes saved!")
  end

  scenario "can NOT change stored email to one already in the DB" do
    fill_in "Email", with: "gary@busey.net"

  end

end
