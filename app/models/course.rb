class Course < ActiveRecord::Base
  enum semester: [:winter, :summer, :fall]
  belongs_to :role
end
