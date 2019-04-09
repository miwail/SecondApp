class ProfilesController < ApplicationController
  before_action :get_profile, only: [:edit, :update, :show]

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Profile successfull updated!"
      redirect_to profile_path(current_user)
    else
      flash.now[:alert] = @profile.errors.full_messages
      render "edit"
    end
  end

  def show

  end

  private
    def profile_params
      params.require(:profile).permit(:name, :second_name, :sex, :birthday,
                                      :about, :country)
    end

    def get_profile
      @profile = current_user.profile
    end

end
