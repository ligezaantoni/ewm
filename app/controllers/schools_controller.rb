class SchoolsController < ApplicationController
  before_action :load_and_authorize_school,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize School
    @schools = School.all
  end

  def show
  end

  def new
    @school = School.new
    authorize @school
  end

  def edit
  end

  def create
    @school = School.new(school_params)
    authorize @school

    if @school.save
      redirect_to @school, notice: 'School was successfully created.'
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_url, notice: 'School was successfully destroyed.'
  end

  private

  def load_and_authorize_school
    @school = School.find(params[:id])
    authorize @school
  end

  def school_params
    params.require(:school).permit(*policy(@school || School).permitted_attributes)
  end
end
