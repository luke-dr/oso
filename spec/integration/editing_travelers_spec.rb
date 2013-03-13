require 'spec_helper'

feature "Editing Travelers" do
  before do
    Factory.create(:traveler,
            :first_name => "Sarah",
            :last_name => "Connor",
            :email => "sarah@connor.co.uk")
    Factory.create(:traveler, :email => "gary@busey.net")

    visit '/travelers'
    click_link "Connor, Sarah"
    click_link "Edit Profile"
  end

  scenario "can change stored email and password" do
    fill_in "First name", :with => "Ethan"
    fill_in "Last name", :with => "Allen"
    fill_in "Email", :with => "ethan@allen.net"
    click_button "Submit"
    page.should have_content("Ethan Allen")
    page.should have_content("ethan@allen.net")
    page.should have_content("Updated information saved.")
  end

  scenario "can NOT submit with blank fields" do
    click_button "Submit"
    page.should have_content("Nothing to submit!")
  end

  scenario "can NOT change stored email to one already in the DB" do
    fill_in "Email", :with => "gary@busey.net"

  end

end
