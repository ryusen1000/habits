class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      redirect_to index
    else
      render :index
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.update(profile_params)
      redirect_to index
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:age, :weight).merge(user_id: current_user.id)
  end
end
