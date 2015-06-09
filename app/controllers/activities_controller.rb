class ActivitiesController < ApplicationController
  before_action :load_and_authorize_activity,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize Activity
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    
    if @activity.save
      redirect_to @activity, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url, notice: 'Activity was successfully destroyed.'
  end

  private
  def load_and_authorize_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def activity_params
    params.require(:activity).permit(*policy(@activity || Activity).permitted_attributes)
  end
end
