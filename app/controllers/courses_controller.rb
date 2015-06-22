class CoursesController < ApplicationController
  def index
    @courses = current_user.courses
    @permissions = current_user.permissions
  end
end
