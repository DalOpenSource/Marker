class UsersController < ApplicationController

  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

end
