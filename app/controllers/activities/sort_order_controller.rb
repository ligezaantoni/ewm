class Activities::SortOrderController < ApplicationController
  before_action :load_and_authorize_event
  before_filter :set_breadcrumbs

  def edit
    @activities = @event.activities.ordered
    authorize Activity, :sort_order?
    add_breadcrumb t(".title")
  end

  def update
    authorize Activity, :sort_order?
    
    params[:activities].each_with_index do |id, index|
      Activity.where(id: id).update_all(position: index)
    end
    
    redirect_to event_url(@event), notice: t(".notice")
  end

  private
  
  def load_and_authorize_event
    @event = Event.find(params[:event_id])
    @event = EventDecorator.decorate(@event)
    authorize @event
  end

  def set_breadcrumbs
    add_breadcrumb t("menu.planning"), events_path
    add_breadcrumb @event.starts_on, event_path(@event)
  end

end