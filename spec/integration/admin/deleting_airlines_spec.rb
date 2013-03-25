require 'spec_helper'

feature "Deleting airlines" do
  let!(:airline) { Factory(:airline, :name => "Virgin America") }
  let!(:admin) { Factory(:admin_user) }



  scenario "Delting an airline" do
    sign_in_as!(admin)
    visit "/admin"
    click_link 'Manage Airlines'
    click_link "Virgin America"
    click_link "Delete Airline"
    page.should have_content("Airline has been deleted.")
    visit "/admin"
    click_link 'Manage Airlines'
    page.should_not have_content("Virgin America")
  end
end
