class Course < ActiveRecord::Base

  # Model Definitions
  enum semester: [:winter, :summer, :fall]
  validates :prefix, presence: true, format: { with: /\A[A-Z]+\z/, 
  	message: "needs uppercase letters" }
  validates :code, presence: true, inclusion: { in: 100..9999 }, numericality: true
  validates :name, format: { with: /\A[\w\s]+\z/, message: "not a proper name" }
  validates :year, presence: true, inclusion: { in: 1900..Date.today.year }, 
  	format: { with: /(19|20)\d{2}/i, message: "should be a four-digit year" }
  validates :semester, presence: true, inclusion: { in: Course.semesters }
  has_many :permissions
  has_many :users, :through => :permissions

  # i.e. "CSCI 1100 - Introduction to Computer Science"
  def to_s
    "#{prefix} #{code} - #{name}"
  end
  
end