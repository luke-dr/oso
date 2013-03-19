class UsersController < ApplicationController
before_filter :authenticate_user!, only: :show

before_filter :find_user, :only => [#:show,
                                    :edit,
                                    :update,
                                    :destroy]

  #this needs to be moved to admin
  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  #this needs to be moved to admin
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => "index"
      flash[:notice] = "User profile created."
    else
      render :action => "new"
      flash[:alert] = "User profile couldn't be saved!"
    end
  end

  def show
    @user = User.find(current_user)
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "User information saved."
      redirect_to @user
    else
      flash[:alert] = "No changes saved!"
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
