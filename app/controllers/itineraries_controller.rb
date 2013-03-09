class ItinerariesController < ApplicationController

  def index

  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    if @itinerary.save
      flash[:notice] = "Itinerary has been created."
      redirect_to @itinerary
    else
      flash[:alrt] = "Itinerary has not been created."
      render :action => "new"
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

end
