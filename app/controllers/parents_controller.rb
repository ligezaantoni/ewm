class ParentsController < ApplicationController
  before_action :load_and_authorize_team,
    only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_scout,
    only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_parent,
    only: [:show, :edit, :update, :destroy]
  before_filter :set_breadcrumbs

  def index
    authorize RelatedPerson
    @parents = RelatedPerson.page(params[:page]).per(20)
    @parents = PaginatingDecorator.decorate(@parents, with: RelatedPersonDecorator)
  end

  def show
    @parent = RelatedPersonDecorator.decorate(@parent)
    add_breadcrumb t(".title")
  end

  def new
    @parent = @scout.parents.build
    authorize @parent
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb t(".title")
  end

  def create
    @parent = RelatedPerson.new(parent_params)
    authorize @parent

    if @parent.save
      redirect_to team_scout_path(@team, @scout), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @parent.update(parent_params)
      redirect_to team_scout_path(@team, @scout), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @parent.destroy
    redirect_to team_scout_path(@team, @scout), notice: t(".notice")
  end

  private

  def load_and_authorize_parent
    @parent = RelatedPerson.find(params[:id])
    authorize @parent
  end
  
  def load_and_authorize_team
    @team = Team.find(params[:team_id])
    @team = TeamDecorator.decorate(@team)
    authorize @team
  end
  
  def load_and_authorize_scout
    @scout = Scout.find(params[:scout_id])
    @scout = ScoutDecorator.decorate(@scout)
    authorize @scout
  end

  def parent_params
    params.require(:related_person).permit(*policy(@parent || RelatedPerson).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
    add_breadcrumb @team.short_name, team_path(@team)
    add_breadcrumb @scout.full_name, team_scout_path(@team, @scout)
  end
end
