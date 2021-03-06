class TeamsController < ApplicationController
  before_action :load_and_authorize_team,
    only: [:show, :edit, :update, :destroy]
  before_action :set_breadcrumbs

  def index
    authorize Team
    @teams = policy_scope(Team).page(params[:page]).per(20)
    @teams = PaginatingDecorator.decorate(@teams, with: TeamDecorator)
  end
  
  def show
    # TODO: Dodać generowanie planu pracy przez axlsx_rails lub prawn
    @team = TeamDecorator.decorate(@team)
    @scouts = PaginatingDecorator.decorate(@team.scouts, with: ScoutDecorator)
    @schools = PaginatingDecorator.decorate(@team.schools, with: SchoolDecorator)
    add_breadcrumb @team.short_name
  end

  def new
    @team = Team.new
    @team.build_address
    @team.user = current_user
    authorize @team
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb TeamDecorator.decorate(@team).short_name, @team
    add_breadcrumb t(".title")
  end

  def create
    @team = Team.new(team_params)
    authorize @team

    if @team.save
      redirect_to @team, notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: t(".notice")
  end

  private

  def load_and_authorize_team
    @team = Team.find(params[:id])
    authorize @team
  end

  def team_params
    params.require(:team).permit(*policy(@team || Team).permitted_attributes)
  end
    
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
  end
end
