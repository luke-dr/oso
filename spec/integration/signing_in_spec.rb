require 'spec_helper'

feature "Signing in" do
  let!(:user) { Factory(:user_confirmed) }

  scenario 'Signing in via form' do
    User.find_by_email(user.email)
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
    page.should have_content(user.name)
    page.current_path.should == "/"
  end
end
