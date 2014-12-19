class MembershipsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @members = @project.memberships
  end

end
