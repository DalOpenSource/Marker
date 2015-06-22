class Permission < ActiveRecord::Base

  # Relationships
  belongs_to :course
  belongs_to :user

end