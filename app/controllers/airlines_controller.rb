class AirlinesController < ApplicationController

  def index
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
      # nothing, yet
    end
  end

  def show
    @airline = Airline.find(params[:id])
  end

end
