class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save || @task.present?
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    if task.destroyed?
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def task_params
    params.require(:task).permit(:theme, :goal)
  end

end
