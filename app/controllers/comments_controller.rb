class CommentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment = Comment.new(comment_params)
    @comment.task = @task
    if @comment.save!
      redirect_to user_project_path(current_user, @project)
    else
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment = Comment.find(params[:id])
    redirect_to user_project_path(current_user, @project) if @comment.destroy
  end

  def edit
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to user_project_path(current_user, @project)
  end

  def move_comment_higher
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment = Comment.find(params[:id])
    @comment.move_higher
    @comment.save!
    redirect_to user_project_path(current_user, @project)
  end

  def move_comment_lower
    @task = Task.find(params[:task_id])
    @project = @task.project
    @comment = Comment.find(params[:id])
    @comment.move_lower
    @comment.save!
    redirect_to user_project_path(current_user, @project)
  end

  def sort
    params[:comment].each_with_index do |id, index|
      Comment.where(id: id).update_all(position: index + 1)
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :task, :duration)
  end
end
