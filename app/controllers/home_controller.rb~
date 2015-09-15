class HomeController < ActionController::Base
  layout "homepage"
  
  def index
    if current_user
      redirect_to teams_path
    else
      @user = User.new
    end
  end
  
end
