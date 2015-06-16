class CoursesController < ApplicationController
  def index
    @courses = current_user.courses.includes(:roles)
  end
end
