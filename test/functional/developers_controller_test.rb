require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end
  test "libraries" do
    get :libraries
    assert_response :success
  end
  test "documentation" do
    get :documentation
    assert_response :success
  end
  test "examples" do
    get :examples
    assert_response :success
  end
end
