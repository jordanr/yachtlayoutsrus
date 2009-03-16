require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "gets index" do
    get :index
    assert_response :success
  end

  test "searches" do
    post :search
    assert assigns(:specs)
    assert_response :success
  end
end
