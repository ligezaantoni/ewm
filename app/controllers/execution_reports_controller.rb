class ExecutionReportsController < ApplicationController
  before_action :load_and_authorize_execution_report,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize ExecutionReport
    @execution_reports = ExecutionReport.all
  end

  def show
  end

  def new
    @execution_report = ExecutionReport.new
    authorize @execution_report
  end

  def edit
  end

  def create
    @execution_report = ExecutionReport.new(execution_report_params)
    authorize @execution_report

    if @execution_report.save
      redirect_to @execution_report, notice: 'Execution report was successfully created.'
    else
      render :new
    end
  end

  def update
    if @execution_report.update(execution_report_params)
      redirect_to @execution_report, notice: 'Execution report was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @execution_report.destroy
    redirect_to execution_reports_url, notice: 'Execution report was successfully destroyed.'
  end

  private

  def load_and_authorize_execution_report
    @execution_report = ExecutionReport.find(params[:id])
    authorize @execution_report
  end

  def execution_report_params
    params.require(:execution_report).permit(*policy(@execution_report || ExecutionReport).permitted_attributes)
  end
end
