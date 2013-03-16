require 'spec_helper'

describe AirlinesController do
  it "displays an error for a missing airline" do
    get :show, :id => "not-here"
    response.should redirect_to(airlines_path)
    message = "The airline you were looking for could not be found."
    flash[:alert].should == message
  end
end
