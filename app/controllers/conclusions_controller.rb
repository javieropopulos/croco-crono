class ConclusionsController < ApplicationController
  def new
    @conclusion = Conclusion.new
    @project = Project.find(params[:project_id])
  end

  def create
    @conclusion = Conclusion.new(conclusion_params)
    @project = Project.find(params[:project_id])
    @conclusion.project = @project
    @conclusion.save!
    redirect_to user_project_path(current_user, @project)
  end

  def edit
    @conclusion = Conclusion.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:project_id])
    @conclusion = Conclusion.find(params[:id])
    @conclusion.update(intro_params)
    @conclusion.save!
    redirect_to user_project_path(current_user, @project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @conclusion = Conclusion.find(params[:id])
    @conclusion.destroy
    redirect_to user_project_path(current_user, @project)
  end

  def move_conclusion_lower
    @project = Project.find(params[:project_id])
    @conclusion = Conclusion.find(params[:id])
    @conclusion.move_lower
    @conclusion.save!
    redirect_to user_project_path(current_user, @project)
  end

  def move_conclusion_higher
    @project = Project.find(params[:project_id])
    @conclusion = Conclusion.find(params[:id])
    @conclusion.move_higher
    @conclusion.save!
    redirect_to user_project_path(current_user, @project)
  end

  private

  def conclusion_params
    params.require(:conclusion).permit(:project, :contenu, :position)
  end
end
