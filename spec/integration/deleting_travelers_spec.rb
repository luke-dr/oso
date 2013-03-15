require 'spec_helper'

feature "Deleting travelers" do
  before do
    traveler = Factory.create(:traveler, first_name: "Craig", last_name: "Frank", email: "fg@fg.net")
    visit "/travelers"
    click_link "Frank, Craig"
  end

  scenario "can remove travelers from the database" do
    click_link "Delete Profile"
    visit "/travelers"
    within("a") do
      page.should_not have_content("Frank, Craig")
      page.should_not have_content("fg@fg.net")
    end
  end
end
