class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_without_password(user_params)
    redirect_to :back, notice: "User updated successfully."
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end