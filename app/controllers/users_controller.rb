class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update_info
    @user = User.find(current_user.id)
    if @user.update_with_password(params.require(:user).permit(:password,:password_confirmation,:current_password))
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

end
