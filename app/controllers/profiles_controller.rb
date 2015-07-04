class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    current_user.profile.update(user_params) if user_signed_in?
    redirect_to :back, notice: "Profile updated successfully."
  end

  private

  def user_params
    params.require(:profile).permit(:first_name, :last_name)
  end

end