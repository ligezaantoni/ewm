class ActivitiesController < ApplicationController
  before_action :load_and_authorize_event
  before_action :load_and_authorize_activity,
    only: [:edit, :update, :destroy]
  before_action :set_breadcrumbs
  
  def index
    authorize Activity
    @activities = @event.activities.ordered.page(params[:page]).per(20)
    @activities = PaginatingDecorator.decorate(@activities, with: ActivityDecorator)
    add_breadcrumb t(".title")
  end
  
  def new
    @activity = if params[:activity].present?
      @event.activities.build(activity_params)
    else
      @event.activities.build
    end

    @activity.build_execution_report
    authorize @activity
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb @activity.name
    add_breadcrumb t(".title")
  end

  def create
    puts "\n\n>>#{activity_params}\n\n"
    @activity = Activity.new(activity_params)
    set_position
    authorize @activity
    
    if @activity.save
      redirect_to event_path(@event), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to event_path(@event), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to event_path(@event), notice: t(".notice")
  end

  private
  
  def set_position
    last_position = @event.activities.pluck(:position).sort.last || 0
    @activity.position = last_position + 1
  end
  
  def load_and_authorize_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end
  
  def load_and_authorize_event
    @event = Event.find(params[:event_id])
    @event = EventDecorator.decorate(@event)
    authorize @event
  end
  
  def activity_params
    params.require(:activity).permit(*policy(@activity || Activity).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.planning"), events_path
    add_breadcrumb @event.starts_on, event_path(@event)
  end
end
