class Profile < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :banner_id, presence: true

  # i.e. "George Louis Costanza"
  def to_s
    "#{first_name} #{middle_name} #{last_name}"
  end

end