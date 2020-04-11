class IntroductionsController < ApplicationController
  def new
    @introduction = Introduction.new
    @project = Project.find(params[:project_id])
  end

  def create
    @introduction = Introduction.new(intro_params)
    @project = Project.find(params[:project_id])
    @introduction.project = @project
    @introduction.save!
    redirect_to user_project_path(current_user, @project)
  end

  def edit
    @introduction = Introduction.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
    @introduction.update(intro_params)
    @introduction.save!
    redirect_to user_project_path(current_user, @project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    redirect_to user_project_path(current_user, @project)
  end

  def move_introduction_lower
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
    @introduction.move_lower
    @introduction.save!
    redirect_to user_project_path(current_user, @project)
  end

  def move_introduction_higher
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
    @introduction.move_higher
    @introduction.save!
    redirect_to user_project_path(current_user, @project)
  end

  private

  def intro_params
    params.require(:introduction).permit(:project, :contenu, :position)
  end
end
