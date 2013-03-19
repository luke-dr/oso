require 'spec_helper'

feature "Deleting users" do
  before do
    user = Factory.create(:user, first_name: "Craig", last_name: "Frank", email: "fg@fg.net")
    visit "/users"
    click_link "Frank, Craig"
  end

  scenario "can remove users from the database" do
    click_link "Delete Profile"
    visit "/users"
    within("a") do
      page.should_not have_content("Frank, Craig")
      page.should_not have_content("fg@fg.net")
    end
  end
end
