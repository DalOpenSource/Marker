class CoursesController < ApplicationController
  def index
    @courses = current_user.courses
  end
end
