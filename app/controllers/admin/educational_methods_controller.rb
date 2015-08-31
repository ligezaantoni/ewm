module Admin
  class EducationalMethodsController < AdminController
    before_action :load_and_authorize_educational_method,
      only: [:show, :edit, :update, :destroy]
    before_action :set_breadcrumbs

    def index
      authorize EducationalMethod
      @educational_methods = EducationalMethod.page(params[:page]).per(20)
      @educational_methods = PaginatingDecorator.decorate(@educational_methods, with: EducationalMethodDecorator)
    end

    def show
      @educational_method = EducationalMethodDecorator.decorate(@educational_method)
      add_breadcrumb t(".title")
    end

    def new
      @educational_method = EducationalMethod.new
      authorize @educational_method
      add_breadcrumb t(".title")
    end

    def edit
      add_breadcrumb t(".title")
    end

    def create
      @educational_method = EducationalMethod.new(educational_method_params)
      authorize @educational_method

      if @educational_method.save
        redirect_to admin_educational_method_path(@educational_method), notice: t(".notice")
      else
        render :new
      end
    end

    def update
      if @educational_method.update(educational_method_params)
        redirect_to admin_educational_method_path(@educational_method), notice: t(".notice")
      else
        render :edit
      end
    end

    def destroy
      @educational_method.destroy
      redirect_to admin_educational_methods_url, notice: t(".notice")
    end

    private

    def load_and_authorize_educational_method
      @educational_method = EducationalMethod.find(params[:id])
      authorize @educational_method
    end

    def educational_method_params
      params.require(:educational_method).permit(*policy(@educational_method || EducationalMethod).permitted_attributes)
    end
    
    def set_breadcrumbs
      add_breadcrumb t("admin.title"), admin_path
      add_breadcrumb t("menu.educational_methods"), admin_educational_methods_path
    end
  end
end
