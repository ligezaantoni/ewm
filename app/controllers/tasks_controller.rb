class TasksController < ApplicationController
  before_action :load_and_authorize_team,
    only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_scout,
    only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :load_and_authorize_task,
    only: [:show, :edit, :update, :destroy]
  before_filter :set_breadcrumbs

  def index
    authorize Task
    @tasks = @scout.tasks.page(params[:page]).per(20)
    @tasks = PaginatingDecorator.decorate(@tasks, with: TaskDecorator)
    
    temp_hash = {}
    @scout.character_traits.map do |character_trait| 
      temp_hash[character_trait.name] = character_trait.activity_forms
    end
    
    @activity_forms = {}
    temp_hash.each do |character_trait_name, activity_forms|
      activity_forms.each do |activity_form|
        @activity_forms[activity_form] = [] if @activity_forms[activity_form].nil?
        @activity_forms[activity_form] << character_trait_name
      end
    end
  end

  def show
    @task = TaskDecorator.decorate(@task)
    add_breadcrumb t(".title")
  end

  def new
    @task = @scout.tasks.build
    if params[:activity_form].present? && params[:character_traits].present?
      @task.activity_form = ActivityForm.find(params[:activity_form])
      @traits_hint = params[:character_traits]
    end
    authorize @task
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb t(".title")
  end

  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.save
      redirect_to team_scout_tasks_path(@team, @scout), notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to team_scout_tasks_path(@team, @scout), notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to team_scout_tasks_path(@team, @scout), notice: t(".notice")
  end

  private

  def load_and_authorize_task
    @task = Task.find(params[:id])
    authorize @task
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

  def task_params
    params.require(:task).permit(*policy(@task || Task).permitted_attributes)
  end
  
  def set_breadcrumbs
    add_breadcrumb t("menu.registry"), teams_path
    add_breadcrumb @team.short_name, team_path(@team)
    add_breadcrumb @scout.full_name, team_scout_path(@team, @scout)
  end
end
