require 'spec_helper'

feature "Viewing airlines" do
  let!(:airline) { Factory(:airline, :name => "Virgin America") }
  let!(:admin) { Factory(:admin_user) }

  scenario "Listing all airlines" do
    sign_in_as!(admin)
    visit '/admin'
    click_link 'Manage Airlines'
    click_link 'Virgin America'
    page.current_url.should == admin_airline_url(airline)
  end
end
