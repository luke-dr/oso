class ItinerariesController < ApplicationController

  def index

  end

  def new
    @itinerary = Itineraries.new
  end
end
