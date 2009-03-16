require 'test_helper'

class SpecificationsControllerTest < ActionController::TestCase
end

class AuthenticatedSpecificationsControllerTest < SpecificationsControllerTest
  tests SpecificationsController

  def setup
    super
    set_basic_authentication
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specification" do
    assert_difference('Specification.count') do
      post :create, :specification => { }
    end

    assert_redirected_to specifications_path
  end

  test "should show specification" do
    get :show, :id => specifications(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => specifications(:one).id
    assert_response :success
  end

  test "should update specification" do
    put :update, :id => specifications(:one).id, :specification => { }
    assert_redirected_to specifications_path
  end

  test "should destroy specification" do
    assert_difference('Specification.count', -1) do
      delete :destroy, :id => specifications(:one).id
    end

    assert_redirected_to specifications_path
  end
end

class UnauthenticatedSpecificationsControllerTest < SpecificationsControllerTest
  tests SpecificationsController

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specifications)
  end

  test "should not get new" do
    get :new
    assert_response 401
  end

  test "should not create specification" do
    assert_no_difference('Specification.count') do
      post :create, :specification => { }
    end

    assert_response 401
  end

  test "should show specification" do
    get :show, :id => specifications(:one).id
    assert_response :success
  end

  test "should not get edit" do
    get :edit, :id => specifications(:one).id
    assert_response 401
  end

  test "should not update specification" do
    put :update, :id => specifications(:one).id, :specification => { }
    assert_response 401
  end

  test "should destroy specification" do
    assert_no_difference('Specification.count', -1) do
      delete :destroy, :id => specifications(:one).id
    end

    assert_response 401
  end
end
