require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "gets index" do
    get :index
    assert_response :success
  end

  test "searches" do
    post :search
    assert_response :success
  end

end
