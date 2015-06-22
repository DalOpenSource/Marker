class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :authentication_keys => [:username]
  has_many :permissions
  has_many :courses, :through => :permissions
  validates :username, presence: true, uniqueness: { :case_sensitive => false }

  # Public Methods
  def in_course?(course)
    course_permissions(course) != nil
  end

  def attends?(course)
    c_permissions = course_permissions(course)
    unless c_permissions == nil
      return c_permissions.attends
    end
    false
  end

  def can_mark?(course)
    c_permissions = course_permissions(course)
    unless c_permissions == nil
      return c_permissions.marks
    end
    false
  end

  def can_edit?(course)
    c_permissions = course_permissions(course)
    unless c_permissions == nil
      return c_permissions.edits
    end
    false
  end

  # Private Methods
  private

  def course_permissions(course)
    permissions.find_by(course: course)
  end

end
