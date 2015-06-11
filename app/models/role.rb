class Role < ActiveRecord::Base
  # a user (could) have many roles in a course.
  # a course has many users with different roles.
  enum standing: [:student, :marker, :instructor]
  belongs_to :course
  belongs_to :user
  validates :standing, :presence: true, :inclusion: { in: standing }
  validates :course_id, :presence: true
  validates :user_id, :presence: true
  validates_associated :users
  validates_associated :courses
end