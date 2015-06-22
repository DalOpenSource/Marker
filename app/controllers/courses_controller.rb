class CoursesController < ApplicationController
  def index
    @courses = current_user.courses
    @permissions = Hash.new
    current_user.permissions.find_each do |p|
      @permissions[p.course.id] = p
    end
  end
end
