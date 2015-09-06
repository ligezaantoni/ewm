class OfficialsController < ApplicationController
  before_action :load_and_authorize_team
  before_action :load_and_authorize_school
  before_action :load_and_authorize_official,
    only: [:show, :edit, :update, :destroy]
  before_filter :set_breadcrumbs

  def new
    @official = @school.officials.build
    authorize @official
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb RelatedPersonDecorator.decorate(@official).full_name_with_role
    add_breadcrumb t(".title")
  end

  def create
    @official = RelatedPerson.new(official_params)
    authorize @official

    if @official.save
      redirect_to team_path(@team), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @official.update(official_params)
      redirect_to team_path(@team), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @official.destroy
    redirect_to team_path(@team), notice: t(".notice")
  end

  private

  def load_and_authorize_official
    @official = RelatedPerson.find(params[:id])
    authorize @official
  end
  
  def load_and_authorize_team
    @team = Team.find(params[:team_id])
    @team = TeamDecorator.decorate(@team)
    authorize @team
  end
  
  def load_and_authorize_school
    @school = School.find(params[:school_id])
    authorize @school
  end

  def official_params
    params.require(:related_person).permit(*policy(@official || RelatedPerson).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
    add_breadcrumb @team.short_name, team_path(@team)
    add_breadcrumb SchoolDecorator.decorate(@school).short_name
  end
end
