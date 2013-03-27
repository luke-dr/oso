class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  before_filter :find_current_user

  def index

  end
end
