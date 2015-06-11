require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  fixtures :users, :courses
  # test "the truth" do
  #   assert true
  # end
  test "query" do
  	assert_not_nil (users(:david)).roles.find_by_course_id(courses(:intro_cs).id).title
  end
end
