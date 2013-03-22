class ItinerariesController < ApplicationController
  before_filter :find_itinerary, :only => [:show,
                                          :edit,
                                          :update,
                                          :destroy ]

  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
    @flight = @itinerary.flights.build
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

  end

  def edit

  end

  def update

    if @itinerary.update_attributes(params[:itinerary])
      flash[:notice] = "Itinerary has been updated."
      redirect_to @itinerary
    else
      flash[:alert] = "Itinerary has not been updated."
      render :action => "edit"
    end
  end

  def destroy

    @itinerary.destroy
    flash[:notice] = "Itinerary has been deleted."
    redirect_to itineraries_path
  end

  private
    def find_itinerary
      @itinerary = Itinerary.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The itinerary you are looking for could not be found."
      redirect_to itineraries_path
    end
end
