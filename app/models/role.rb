class Role < ActiveRecord::Base
  enum standing: [:student, :marker, :instructor]
  has_many :users
  has_many :courses
  validates :title, :presence: true
  validates :standing, :presence: true
  validates :course_id, :presence: true
  validates :user_id, :presence: true
end