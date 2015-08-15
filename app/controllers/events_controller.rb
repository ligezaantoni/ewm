class EventsController < ApplicationController
  before_action :load_and_authorize_event,
    only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  def index
    authorize Event
    @events = Event.page(params[:page]).per(20)
    @events = PaginatingDecorator.decorate(@events, with: EventDecorator)
  end

  def show
    @event = EventDecorator.decorate(@event)
    @activities = PaginatingDecorator.decorate(@event.activities.ordered, with: ::ActivityDecorator)
    add_breadcrumb @event.starts_on
  end

  def new
    @event = Event.new
    authorize @event
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb t(".title")
  end

  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
      redirect_to @event, notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t(".notice")
  end

  private

  def load_and_authorize_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(*policy(@event || Event).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.planning"), events_path
  end
end
