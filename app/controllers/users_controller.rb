class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @permissions = @user.permissions
  end

end
