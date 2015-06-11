class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @courses = @user.courses.includes(:roles).all
  end

end
