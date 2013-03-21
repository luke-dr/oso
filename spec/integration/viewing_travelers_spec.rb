require 'spec_helper'

feature "Viewing Travelers" do
traveler = Factory.create(:traveler)

  scenario "can show all traveler information" do
    visit '/travelers'
    click_link "Traveler, Mike"
    page.should have_content("Mike Traveler")
    page.should have_content(traveler.email)
  end

end
