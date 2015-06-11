require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "id" do
  	id = users(:david).id
  	assert_not_nil id
  	assert_equal 1, id
  end
end
