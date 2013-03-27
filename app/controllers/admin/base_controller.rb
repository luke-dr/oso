class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
  before_filter :find_current_user

  def index
    PivotalTracker::Client.token = '7359568a48cabd658d883d5993365410'
    @project = PivotalTracker::Project.find(783957)
    @stories = @project.stories.all
  end
end
