class ItinerariesController < ApplicationController

  def index
    @itineraries = Itinerary.all
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

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update_attributes(params[:itinerary])
      flash[:notice] = "Itinerary has been updated."
      redirect_to @itinerary
    else
      flash[:alert] = "Itinerary has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    flash[:notice] = "Itinerary has been deleted."
    redirect_to itineraries_path
  end

end
