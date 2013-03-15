require 'spec_helper'

feature "Viewing airlines" do
  scenario "Listing all airlines" do
    airline = Factory.create(:airline, :name => "Virgin America")
    visit '/airlines'
    click_link 'Virgin America'
    page.current_url.should == airline_url(airline)
  end
end
