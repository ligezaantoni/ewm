class ExecutionReportsController < ApplicationController
  before_action :set_execution_report, only: [:show, :edit, :update, :destroy]

  # GET /execution_reports
  def index
    @execution_reports = ExecutionReport.all
  end

  # GET /execution_reports/1
  def show
  end

  # GET /execution_reports/new
  def new
    @execution_report = ExecutionReport.new
  end

  # GET /execution_reports/1/edit
  def edit
  end

  # POST /execution_reports
  def create
    @execution_report = ExecutionReport.new(execution_report_params)

    if @execution_report.save
      redirect_to @execution_report, notice: 'Execution report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /execution_reports/1
  def update
    if @execution_report.update(execution_report_params)
      redirect_to @execution_report, notice: 'Execution report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /execution_reports/1
  def destroy
    @execution_report.destroy
    redirect_to execution_reports_url, notice: 'Execution report was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_execution_report
      @execution_report = ExecutionReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def execution_report_params
      params.require(:execution_report).permit(:activity_id, :content)
    end
end
