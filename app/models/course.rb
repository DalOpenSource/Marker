class Course < ActiveRecord::Base
  enum semester: [:winter, :summer, :fall]
end
