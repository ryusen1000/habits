class MotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:index, :create]

  def index
    @motions = Motion.all
    @motion = Motion.new
  end

  def create
    @motion = Motion.create(motion_params)
    if @motion.save
      redirect_to task_motions_path
    else
      render :index
    end
  end

  def destroy
    motion = Motion.find(params[:id])
    motion.destroy
    if motion.destroyed?
      redirect_to task_motions_path
    else
      render :index
    end
  end

  private
  def motion_params
    params.require(:motion).permit(
      :act, :amount, :if_act, :if_amount
    ).merge(task_id: params[:task_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
