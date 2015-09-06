class ProfilesController < ApplicationController
  before_action :load_and_authorize_profile,
    only: [:edit, :update]

  def edit
    @profile.build_address unless @profile.address.present?
    add_breadcrumb t(".title")
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: t(".notice")
    else
      render :edit
    end
  end

  private

  def load_and_authorize_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def profile_params
    params.require(:profile).permit(*policy(@profile || Profile).permitted_attributes)
  end

end
