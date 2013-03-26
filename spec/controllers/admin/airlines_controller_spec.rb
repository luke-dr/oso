require 'spec_helper'

describe Admin::AirlinesController do
  let!(:admin) { Factory(:admin_user) }

  it "displays an error for a missing airline" do
    sign_in(:user, admin)
    get :show, :id => "not-here"
    response.should redirect_to(admin_airlines_path)
    message = "The airline you were looking for could not be found."
    flash[:alert].should == message
  end
end
