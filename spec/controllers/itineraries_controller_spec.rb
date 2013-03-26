require 'spec_helper'

describe ItinerariesController do
  let!(:user) { Factory(:user_confirmed) }

  it "Displays an error for a missing itinerary" do
    sign_in(:user, user)
    get :show, :id => "not-here"
    response.should redirect_to(itineraries_path)
    message = "The itinerary you are looking for could not be found."
    flash[:alert].should == message
  end
end
