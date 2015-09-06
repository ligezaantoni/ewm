class ScoutsController < ApplicationController
  before_action :load_and_authorize_team
  before_action :load_and_authorize_scout,
    only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  def show
    @scout = ScoutDecorator.decorate(@scout)
    @parents = PaginatingDecorator.decorate(@scout.parents, with: RelatedPersonDecorator)
    add_breadcrumb @scout.full_name
  end

  def new
    @scout = @team.scouts.build
    @scout.build_address
    authorize @scout
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb ScoutDecorator.decorate(@scout).full_name, team_scout_path(@team, @scout)
    add_breadcrumb t(".title")
  end

  def create
    @scout = Scout.new(scout_params)
    authorize @scout

    if @scout.save
      redirect_to team_scout_path(@team, @scout), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @scout.update(scout_params)
      redirect_to team_scout_path(@team, @scout), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @scout.destroy
    redirect_to team_url(@team), notice: t(".notice")
  end

  private

  def load_and_authorize_scout
    @scout = Scout.find(params[:id])
    authorize @scout
  end
  
  def load_and_authorize_team
    @team = Team.find(params[:team_id])
    @team = TeamDecorator.decorate(@team)
    authorize @team
  end

  def scout_params
    params.require(:scout).permit(*policy(@scout || Scout).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
    add_breadcrumb @team.short_name, team_path(@team)
  end
end
