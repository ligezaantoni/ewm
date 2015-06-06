class EducationalMethodsController < ApplicationController
  before_action :set_educational_method, only: [:show, :edit, :update, :destroy]

  # GET /educational_methods
  def index
    @educational_methods = EducationalMethod.all
  end

  # GET /educational_methods/1
  def show
  end

  # GET /educational_methods/new
  def new
    @educational_method = EducationalMethod.new
  end

  # GET /educational_methods/1/edit
  def edit
  end

  # POST /educational_methods
  def create
    @educational_method = EducationalMethod.new(educational_method_params)

    if @educational_method.save
      redirect_to @educational_method, notice: 'Educational method was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /educational_methods/1
  def update
    if @educational_method.update(educational_method_params)
      redirect_to @educational_method, notice: 'Educational method was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /educational_methods/1
  def destroy
    @educational_method.destroy
    redirect_to educational_methods_url, notice: 'Educational method was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_educational_method
      @educational_method = EducationalMethod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def educational_method_params
      params.require(:educational_method).permit(:name)
    end
end
