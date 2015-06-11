class Role < ActiveRecord::Base
  # a user (could) have many roles in a course.
  # a course has many users with different roles.
  enum title: [:student, :marker, :instructor]
  belongs_to :course
  belongs_to :user
  validates :title, :presence: true, :numericality: true, :inclusion: { in: title }
  validates :course_id, :presence: true, :numericality: true
  validates :user_id, :presence: true, :numericality: true
  validates_associated :users
  validates_associated :courses
end