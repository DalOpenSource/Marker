class Role < ActiveRecord::Base
  # a user (could) have many roles in a course.
  # a course has many users with different roles.
  enum title: [:student, :marker, :instructor]
  belongs_to :course
  belongs_to :user
  validates :title, presence: true, inclusion: { in: Role.titles }
  validates :course_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true
  validates_associated :user
  validates_associated :course
end