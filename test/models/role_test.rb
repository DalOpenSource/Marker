require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  fixtures :users, :courses
  # test "the truth" do
  #   assert true
  # end
  test "query" do
  	r = (users(:david)).roles.find_by_course_id(1)
  	assert_not_nil r
  	assert_equal roles(:david_marker), r
  	assert_not_nil r.title
  end
end
