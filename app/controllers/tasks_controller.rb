class TasksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save!
      redirect_to user_project_path(current_user, @project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_project_path(current_user, @project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @project = @task.project
    @task.update(task_params)
    redirect_to user_project_path(current_user, @project)
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments
  end

  def move_task_lower
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.move_lower
    @task.save!
    redirect_to user_project_path(current_user, @project)
  end

  def move_task_higher
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.move_higher
    @task.save!
    redirect_to user_project_path(current_user, @project)
  end

  def sort
    params[:span].each_with_index do |id, index|
      Span.where(id: id).update_all(position: index + 1)
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :duration, :project, :position)
  end
end
