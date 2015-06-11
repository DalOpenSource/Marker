class Course < ActiveRecord::Base
  enum semester: [:winter, :summer, :fall]
  has_many :roles
  has_many :users, :through => :roles
end
