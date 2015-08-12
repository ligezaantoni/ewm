class SchoolsController < ApplicationController
  before_action :load_and_authorize_team,
    only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_school,
    only: [:show, :edit, :update, :destroy]
  before_filter :set_breadcrumbs

  def index
    authorize School
    @schools = School.page(params[:page]).per(20)
    @schools = PaginatingDecorator.decorate(@schools, with: SchoolDecorator)
  end

  def show
    @school = SchoolDecorator.decorate(@school)
    add_breadcrumb t(".title")
  end

  def new
    @school = @team.schools.build
    @school.build_address
    authorize @school
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb t(".title")
  end

  def create
    @school = School.new(school_params)
    authorize @school

    if @school.save
      redirect_to team_path(@team), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @school.update(school_params)
      redirect_to team_path(@team), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to team_url(@team), notice: t(".notice")
  end

  private

  def load_and_authorize_school
    @school = School.find(params[:id])
    authorize @school
  end
  
  def load_and_authorize_team
    @team = Team.find(params[:team_id])
    @team = TeamDecorator.decorate(@team)
    authorize @team
  end
  
  def school_params
    params.require(:school).permit(*policy(@school || School).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
    add_breadcrumb @team.short_name, team_path(@team)
  end
end
