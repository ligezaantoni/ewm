class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
  before_filter :reset_breadcrumbs, :authenticate_user!
  add_breadcrumb I18n.t("nav.home"), :root_path
  
  private
  
  def reset_breadcrumbs
    @breadcrumbs = nil
  end
end
