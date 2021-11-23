class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new
  end

  def create
    new_task = Task.new(task_params)
    redirect_to tasks_path if new_task.save
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    redirect_to task_path(task) if task.update(task_params)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
