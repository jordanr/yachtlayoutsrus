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

class XMLWelcomeControllerTest < ActionController::TestCase
  tests WelcomeController

  def setup
    super
    @request.env['HTTP_ACCEPT'] = 'application/xml'
  end

  test "gets specs" do
    get :index, :method=>'specifications_get'
    assert_response :redirect
  end
  test "gets spec" do
    get :index, :method=>'specification_get', :id=>1
    assert_response :redirect
  end
  test "gets photos" do
    get :index, :method=>'specification_photos_get', :specification_id=>1
    assert_response :redirect
  end
  test "gets photo" do
    get :index, :method=>'specification_photo_get', :specification_id=>1, :id=>1
    assert_response :redirect
  end
end
