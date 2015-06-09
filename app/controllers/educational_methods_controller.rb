class EducationalMethodsController < ApplicationController
  before_action :load_and_authorize_educational_method,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize EducationalMethod
    @educational_methods = EducationalMethod.all
  end

  def show
  end

  def new
    @educational_method = EducationalMethod.new
    authorize @educational_method
  end

  def edit
  end

  def create
    @educational_method = EducationalMethod.new(educational_method_params)
    authorize @educational_method

    if @educational_method.save
      redirect_to @educational_method, notice: 'Educational method was successfully created.'
    else
      render :new
    end
  end

  def update
    if @educational_method.update(educational_method_params)
      redirect_to @educational_method, notice: 'Educational method was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @educational_method.destroy
    redirect_to educational_methods_url, notice: 'Educational method was successfully destroyed.'
  end

  private

  def load_and_authorize_educational_method
    @educational_method = EducationalMethod.find(params[:id])
    authorize @educational_method
  end

  def educational_method_params
    params.require(:educational_method).permit(*policy(@educational_method || EducationalMethod).permitted_attributes)
  end
end
