class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path
      flash[:notice] = "User account created."
    else
      render :new
      flash[:alert] = "User account couldn't be saved!"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account deleted."
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
