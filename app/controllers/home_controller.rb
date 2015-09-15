class HomeController < ActionController::Base
  layout "homepage"
  
  def index
    if current_user
      redirect_to teams_path
    else
      @user = User.new
    end
  end
  
  def download_pdf
    send_file(
      "#{Rails.root}/app/assets/documents/mgr_antoni_ligeza.pdf",
      filename: "mgr_antoni_ligeza.pdf",
      type: "application/pdf"
    )
  end
  
end
