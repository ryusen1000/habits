class TasksController < ApplicationController
  before_action :authenticate_user! , except: :index

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task.save
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
    params.require(:task).permit(:theme, :goal).merge(user_id: current_user.id)
  end

end
