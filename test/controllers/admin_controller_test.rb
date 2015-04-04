require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get items" do
    get :items
    assert_response :success
  end

  test "should get members" do
    get :members
    assert_response :success
  end

end
