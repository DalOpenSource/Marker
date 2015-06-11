class Course < ActiveRecord::Base
  enum semester: [:winter, :summer, :fall]
  has_many :roles
end
