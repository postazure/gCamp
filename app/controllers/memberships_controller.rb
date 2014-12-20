class MembershipsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships #members on project
    @new_membership = @project.memberships.new #members not on project
  end

  def create
    @project = Project.find(params[:project_id])
    membership = @project.memberships.new(membership_params)
    if membership.save
      redirect_to project_memberships_path(@project)
    else
      redirect_to project_memberships_path(@project), alert: "Please select a user"
    end
  end

  def update
    @project = Project.find(params[:project_id])
    membership = @project.memberships.find(params[:id])
    if membership.update(membership_params)
      redirect_to project_memberships_path, notice: "#{membership.user.full_name} was successfully updated"
    else
      redirect_to project_memberships_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path, notice: "#{@membership.user.full_name} was removed successfully"
  end

  private
    def membership_params
      params.require(:membership).permit(
        :project_id,
        :user_id,
        :role_id,
      )
    end

end
