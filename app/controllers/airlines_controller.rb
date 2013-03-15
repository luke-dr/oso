class AirlinesController < ApplicationController

  def index
    @airlines = Airline.all
  end

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new(params[:airline])
    if @airline.save
      flash[:notice] = "Airline has been added."
      redirect_to @airline
    else
      flash[:alert] = "Airline has not been created."
      render :action => "new"
    end
  end

  def show
    @airline = Airline.find(params[:id])
  end

end
