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
    click_link "Edit My Account"
  end

  scenario "user can change their name, email, and password" do
    fill_in "Name", with: "Ethan Allen"
    fill_in "Email", with: "ethan@allen.net"
    fill_in "Password", with: "passwordnew"
    fill_in "Password confirmation", with: "passwordnew"
    fill_in "Current password", with: user.password
    click_button "Update"

    page.should have_content("Ethan Allen")
    page.should have_content("ethan@allen.net")
    page.should have_content("*updated *successfully *email *confirm *address")
  end

  scenario "can NOT submit blank email, blank name okay" do
    fill_in "Name", with: nil
    fill_in "Email", with: nil
    fill_in "Current password", with: user.password
    click_button "Update"
    page.should have_content("Email can't be blank")
    page.should_not have_content("Name can't be blank")

  end

  scenario "can NOT change stored email to one already in the DB" do
    fill_in "Email", with: "gary@busey.net"
    fill_in "Current password", with: user.password
  end
end
