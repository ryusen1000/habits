class MotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:index, :create]

  def index
    @motions = Motion.all
    @motion = Motion.new
    # = Motion.where(task_id: @task.id)
    @checkacts = Checkact.where(:motion_id == @motion.id)
    @checkacts.each do |c|
      @checkacts_data = Date.parse(c.created_at.to_s)
    end
    @check_days = check_days

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

  def check_days
    require "date"
    today_data = Date.today
    today_data == @checkacts_data
  end
end
