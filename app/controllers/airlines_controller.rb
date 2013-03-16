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

  def edit
    @airline = Airline.find(params[:id])
  end

  def update
    @airline = Airline.find(params[:id])
    if @airline.update_attributes(params[:airline])
      flash[:notice] = "Airline has been updated."
      redirect_to @airline
    else
      flash[:alert] = "Airline has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @airline = Airline.find(params[:id])
    @airline.destroy
    flash[:notice] = "Airline has been deleted."
    redirect_to airlines_path
  end

end
