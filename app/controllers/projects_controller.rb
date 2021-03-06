class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!
      redirect_to user_projects_path(current_user)
    else
      render 'new'
    end
  end

  def index
    @projects = Project.all.select { |x| x.user == current_user }
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @introductions = @project.introductions
    @conclusions = @project.conclusions
    @counter = 0
    @tasks.each { |task| task.comments.each { |comment| @counter += (comment.duration || 0) } }
    @start_time = @project.start_time.to_s[10..-8]
    @minutes = @start_time[-2..-1].to_i
    @hours = @start_time[0..2].to_i
    @comment = Comment.new
  end

  def destroy
    @project = Project.find(params[:id])
    redirect_to user_projects_path(current_user) if @project.destroy
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to user_project_path(current_user, @project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :user, :start_time, :description)
  end
end
