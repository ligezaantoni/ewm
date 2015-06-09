class ScoutsController < ApplicationController
  before_action :load_and_authorize_scout,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize Scout
    @scouts = Scout.all
  end

  def show
  end

  def new
    @scout = Scout.new
    authorize @scout
  end

  def edit
  end

  def create
    @scout = Scout.new(scout_params)
    authorize @scout

    if @scout.save
      redirect_to @scout, notice: 'Scout was successfully created.'
    else
      render :new
    end
  end

  def update
    if @scout.update(scout_params)
      redirect_to @scout, notice: 'Scout was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @scout.destroy
    redirect_to scouts_url, notice: 'Scout was successfully destroyed.'
  end

  private

  def load_and_authorize_scout
    @scout = Scout.find(params[:id])
    authorize @scout
  end

  def scout_params
    params.require(:scout).permit(*policy(@scout || Scout).permitted_attributes)
  end
end
