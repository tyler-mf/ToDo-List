class TasksController < ApplicationController
	before_filter :authenticate_user!

  def  index
    @tasks = current_user.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.new(params[:task])
    if @task.save
      flash[:success] = "Task created"
      redirect_to @task
    else
      render action: :edit
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task
      flash[:success] = "Task updated"
    else
      render action: :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task destroyed"
    redirect_to tasks_path
  end
end
