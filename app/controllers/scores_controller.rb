class ScoresController < ApplicationController
  before_action :load_and_authorize_score,
    only: [:edit, :update, :destroy]
  before_action :set_breadcrumbs

  def index
    authorize Team
    @teams = policy_scope(Team).page(params[:page]).per(1)
    @teams = PaginatingDecorator.decorate(@teams, with: TeamDecorator)
  end

  def show
    @scout = Scout.find(params[:id])
    @scout = ScoutDecorator.decorate(@scout)
    
    @scores = @scout.scores
    add_breadcrumb @scout.full_name
  end

  def new
    @score = params[:score].present? ? Score.new(score_params) : Score.new
    authorize @score
    add_breadcrumb ScoutDecorator.decorate(@score.scout).full_name, score_path(@score.scout)
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb t(".title")
  end

  def create
    @score = Score.new(score_params)
    authorize @score

    if @score.save
      redirect_to score_path(@score.scout_id), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @score.update(score_params)
      redirect_to score_path(@score.scout_id), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @score.destroy
    redirect_to score_path(@score.scout_id), notice: t(".notice")
  end

  private

  def load_and_authorize_score
    @score = Score.find(params[:id])
    authorize @score
  end

  def score_params
    params.require(:score).permit(*policy(@score || Score).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.rating"), scores_path
  end
end
