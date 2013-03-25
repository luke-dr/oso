class UsersController < ApplicationController
before_filter :authenticate_user!, :except => [:new, :update]
before_filter :find_user, :only => [#:show,
                                    :edit,
                                    :update,
                                    :destroy]

  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user)
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your contact information has been updated!"
      redirect_to @user
    else
      flash.now[:alert] = "No changes saved!"
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account deleted."
    redirect_to "/"
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
