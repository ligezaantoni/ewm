class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
  before_filter :reset_breadcrumbs, :authenticate_user!
  add_breadcrumb I18n.t("nav.home"), :root_path
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to root_path, notice: t("home.not_authorized_notice")
  end
  
  def reset_breadcrumbs
    @breadcrumbs = nil
  end
end
