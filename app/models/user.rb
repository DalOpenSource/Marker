class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :registerable, :validatable, :authentication_keys => [:username]

  # Relationships
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :permissions
  has_many :courses, :through => :permissions

  # Callbacks
  after_create :create_profile # Make sure the user has a profile.

  # Validations
  validates :username, presence: true, uniqueness: { :case_sensitive => false }

end
