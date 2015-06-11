require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  fixtures :users, :courses
  # test "the truth" do
  #   assert true
  # end
  test "query" do
  	assert_not_nil david.roles.find_by_course(one).title
  end
end
