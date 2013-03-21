require 'spec_helper'

feature "Deleting airlines" do
  scenario "Delting an airline" do
    Factory(:airline, :name => "Virgin America")
    visit "/airlines"
    click_link "Virgin America"
    click_link "Delete Airline"
    page.should have_content("Airline has been deleted.")

    visit "/airlines"
    page.should_not have_content("Virgin America")
  end
end
