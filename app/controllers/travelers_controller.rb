class TravelersController < ApplicationController
  before_filter :find_traveler, :only => [#:show,
                                          :edit,
                                          :update,
                                          :destroy]
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
    @traveler = Traveler.find(current_user)
  end

  def edit
  end

  def update
    if @traveler.update_attributes(params[:traveler])
      flash[:notice] = "Traveler information saved."
      redirect_to @traveler
    else
      flash[:alert] = "No changes saved!"
      render :action => :edit
    end
  end

  def destroy
    @traveler.destroy
    flash[:notice] = "Traveler has been deleted."
    redirect_to travelers_path
  end

  private

  def find_traveler
    @traveler = Traveler.find(params[:id])
  end

end
