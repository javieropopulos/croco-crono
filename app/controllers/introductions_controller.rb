class IntroductionsController < ApplicationController
  def index
    @introductions = Introduction.all
  end

  def show
    @introduction = Introduction.find(params[:id])
  end

  def new
    @introduction = Introduction.new
  end

  def create
    @introduction = Introduction.new(intro_params)
    project = Project.find(params[:project_id])
    @introduction.project = project
    @introduction.save!
  end

  def destroy
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
    @introduction.destroy
    redirect_to user_project_path(current_user, @project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @introduction = Introduction.find(params[:id])
  end

  def update
    @introduction = Introduction.find(params[:id])
    @introduction.update(intro_params)
    redirect_to user_project_path(current_user, @project)
  end

  private

  def intro_params
    params.require(:introduction).permit(:project, :contenu)
  end
end
