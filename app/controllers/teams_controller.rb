class TeamsController < ApplicationController
  before_action :load_and_authorize_team,
    only: [:show, :edit, :update, :destroy]

  def index
    authorize Team
    @teams = Team.all
  end
  
  def show
  end

  def new
    @team = Team.new
    authorize @team
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    authorize @team

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

  private

  def load_and_authorize_team
    @team = Team.find(params[:id])
    authorize @team
  end

  def team_params
    params.require(:team).permit(*policy(@team || Team).permitted_attributes)
  end
end
