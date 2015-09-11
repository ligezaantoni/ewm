class TasksController < ApplicationController
  before_action :load_and_authorize_task,
    only: [:show, :edit, :update, :destroy]
  before_filter :set_breadcrumbs

  def index
    authorize Task
    
    @individual_tasks = policy_scope(Task).where(taskable_type: "Scout").page(params[:page]).per(20)
    @individual_tasks = PaginatingDecorator.decorate(@individual_tasks, with: TaskDecorator)
    
    @goals = policy_scope(Task).where(taskable_type: "Team").page(params[:page]).per(20)
    @goals = PaginatingDecorator.decorate(@goals, with: TaskDecorator)
  end

  def show
    @task = TaskDecorator.decorate(@task)
    add_breadcrumb @task.activity_form_name
  end

  def new
    @task = Task.new
    @type = params[:type]
    authorize @task
    add_breadcrumb t(".title")
  end

  def edit
    add_breadcrumb @task.activity_form.name, @task
    add_breadcrumb t(".title")
  end

  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.save
      redirect_to tasks_path, notice: t(".notice")
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: t(".notice")
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: t(".notice")
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
    add_breadcrumb t("menu.training"), tasks_path
  end
end
