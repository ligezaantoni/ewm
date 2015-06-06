class ActivityFormsController < ApplicationController
  before_action :set_activity_form, only: [:show, :edit, :update, :destroy]

  # GET /activity_forms
  def index
    @activity_forms = ActivityForm.all
  end

  # GET /activity_forms/1
  def show
  end

  # GET /activity_forms/new
  def new
    @activity_form = ActivityForm.new
  end

  # GET /activity_forms/1/edit
  def edit
  end

  # POST /activity_forms
  def create
    @activity_form = ActivityForm.new(activity_form_params)

    if @activity_form.save
      redirect_to @activity_form, notice: 'Activity form was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activity_forms/1
  def update
    if @activity_form.update(activity_form_params)
      redirect_to @activity_form, notice: 'Activity form was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /activity_forms/1
  def destroy
    @activity_form.destroy
    redirect_to activity_forms_url, notice: 'Activity form was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_form
      @activity_form = ActivityForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_form_params
      params.require(:activity_form).permit(:educational_method_id, :description)
    end
end
