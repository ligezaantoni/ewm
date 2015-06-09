class ActivityFormsController < ApplicationController
  before_action :load_and_authorize_activity_form,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize ActivityForm
    @activity_forms = ActivityForm.all
  end

  def show
  end

  def new
    @activity_form = ActivityForm.new
    authorize @activity_form
  end

  def edit
  end

  def create
    @activity_form = ActivityForm.new(activity_form_params)
    authorize @activity_form

    if @activity_form.save
      redirect_to @activity_form, notice: 'Activity form was successfully created.'
    else
      render :new
    end
  end

  def update
    if @activity_form.update(activity_form_params)
      redirect_to @activity_form, notice: 'Activity form was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @activity_form.destroy
    redirect_to activity_forms_url, notice: 'Activity form was successfully destroyed.'
  end

  private
  
  def load_and_authorize_activity_form
    @activity_form = ActivityForm.find(params[:id])
    authorize @activity_form
  end

  def activity_form_params
    params.require(:activity_form).permit(*policy(@activity_form || ActivityForm).permitted_attributes)
  end
end
