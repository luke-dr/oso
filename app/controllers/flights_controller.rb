class FlightsController < ApplicationController

  before_filter :find_itinerary

  def new
    @flight = @itinerary.flights.build
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
  end

  private
  def find_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

end
