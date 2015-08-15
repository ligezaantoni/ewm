class ExecutionReportsController < ApplicationController
  before_action :load_and_authorize_event,
    only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_activity,
    only: [:show, :edit, :update, :destroy]
  before_action :load_and_authorize_execution_report,
    only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  def index
    authorize ExecutionReport
    @execution_reports = ExecutionReport.page(params[:page]).per(20)
    @execution_reports = PaginatingDecorator.
      decorate(@execution_reports, with: ExecutionReportDecorator)
  end

  def show
    @execution_reports = ExecutionReportDecorator.decorate(@execution_report)
    add_breadcrumb t(".title")
  end

  def new
    @execution_report = @activity.build_execution_report
    authorize @execution_report
    add_breadcrumb t(".title")
  end

  def edit
  add_breadcrumb t(".title")
  end

  def create
    @execution_report = ExecutionReport.new(execution_report_params)
    authorize @execution_report

    if @execution_report.save
      redirect_to event_path(@event), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @execution_report.update(execution_report_params)
      redirect_to event_path(@event), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @execution_report.destroy
    redirect_to event_path(@event), notice: t(".notice")
  end

  private
  
  def load_and_authorize_activity
    @activity = Activity.find(params[:id])
    @activity = ActivityDecorator.decorate(@activity)
    authorize @activity
  end
  
  def load_and_authorize_event
    @event = Event.find(params[:event_id])
    @event = EventDecorator.decorate(@event)
    authorize @event
  end

  def load_and_authorize_execution_report
    @execution_report = ExecutionReport.find(params[:id])
    authorize @execution_report
  end

  def execution_report_params
    params.require(:execution_report).permit(*policy(@execution_report || ExecutionReport).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.planning"), events_path
    add_breadcrumb @event.starts_on, event_path(@event)
    add_breadcrumb @activity.name, event_activity_path(@event, @activity)
  end
end
