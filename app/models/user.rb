class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :registerable, :validatable, :authentication_keys => [:username]
  has_many :permissions
  has_many :courses, :through => :permissions
  validates :username, presence: true, uniqueness: { :case_sensitive => false }
  
  # i.e. "George Louis Costanza"
  def to_s
    "#{first_name} #{middle_name} #{last_name}"
  end

end
