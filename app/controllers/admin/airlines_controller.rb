class Admin::AirlinesController < Admin::BaseController
  before_filter :find_airline, :only => [:show, :edit, :update, :destroy]

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
      redirect_to [:admin, @airline]
    else
      flash[:alert] = "Airline has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @airline.update_attributes(params[:airline])
      flash[:notice] = "Airline has been updated."
      redirect_to [:admin, @airline]
    else
      flash[:alert] = "Airline has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @airline.destroy
    flash[:notice] = "Airline has been deleted."
    redirect_to admin_airlines_path
  end

private
  def find_airline
    @airline = Airline.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The airline you were looking for could not be found."
    redirect_to admin_airlines_path
  end

end
