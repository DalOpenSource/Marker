class ProfilesController < ApplicationController

  include ApplicationHelper

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(user_params)
      flash[:notice] = "Profile updated."
    else
      flash[:error] = errors_as_sentence @profile
    end
    render partial: 'partials/flash'
  end

  private

  def user_params
    params.require(:profile).permit(:first_name, :last_name)
  end

end