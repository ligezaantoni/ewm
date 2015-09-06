module Admin
  class AbilitiesController < AdminController
    before_action :load_and_authorize_ability,
      only: [:show, :edit, :update, :destroy]
    before_action :set_breadcrumbs

    def index
      authorize Ability
      @abilities = Ability.page(params[:page]).per(20)
      @abilities = PaginatingDecorator.decorate(@abilities, with: AbilityDecorator)
    end

    def show
      @ability = AbilityDecorator.decorate(@ability)
      add_breadcrumb @ability.name
    end

    def new
      @ability = Ability.new
      authorize @ability
      add_breadcrumb t(".title")
    end

    def edit
      add_breadcrumb @ability.name, admin_ability_path(@ability)
      add_breadcrumb t(".title")
    end

    def create
      @ability = Ability.new(ability_params)
      authorize @ability

      if @ability.save
        redirect_to admin_ability_path(@ability), notice: t(".notice")
      else
        render :new
      end
    end

    def update
      if @ability.update(ability_params)
        redirect_to admin_ability_path(@ability), notice: t(".notice")
      else
        render :edit
      end
    end

    def destroy
      @ability.destroy
      redirect_to admin_abilities_url, notice: t(".notice")
    end

    private
    
    def load_and_authorize_ability
      @ability = Ability.find(params[:id])
      authorize @ability
    end

    def ability_params
      params.require(:ability).permit(*policy(@ability || Ability).permitted_attributes)
    end

    def set_breadcrumbs
      add_breadcrumb t("admin.title"), admin_path
      add_breadcrumb t("menu.abilities"), admin_abilities_path
    end
    
  end
end
