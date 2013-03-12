require 'spec_helper'

describe ItinerariesController do
  it "Displays an error for a missing itinerary" do
    get :show, :id => "not-here"
    response.should redirect_to(itineraries_path)
    message = "The itinerary you are looking for could not be found."
    flash[:alert].should == message
  end
end
