class CheckactsController < ApplicationController
  def index
    @motion = Motion.find(params[:motion_id])
  end
  def create
    @motion = Motion.find(params[:motion_id])
    @checkact = Checkact.create(chechact_params)
    if @checkact.save
      redirect_to task_motions_path
    else
      render task_motions_path
    end
  end

  private
  def chechact_params
    params.permit(:completion, :created_at).merge(motion_id: params[:motion_id])
  end
end
