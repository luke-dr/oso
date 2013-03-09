class TravelersController < ApplicationController

  def index
      @travelers = Traveler.all
  end

  def new
    @traveler = Traveler.new
  end

  def create
    @traveler = Traveler.new(params[:traveler])
    if @traveler.save
      redirect_to :action => "index"
      flash[:notice] = "Traveler profile created."
    else
      render :action => "new"
      flash[:alert] = "Traveler profile couldn't be saved!"
    end
  end

  def show
    @traveler = Traveler.find(params[:id])
  end
end
