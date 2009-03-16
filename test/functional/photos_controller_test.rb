require 'test_helper'

class Photo
  def swf_uploaded_data=(data)
  end

  def new
  end

  def save
  end
end


class PhotosController
  include AuthenticationTestHelper
end

class PhotosControllerTest < ActionController::TestCase
end

class AuthenticatedPhotosControllerTest < PhotosControllerTest
  tests PhotosController
  def setup
    super
    set_basic_authentication
  end

  def test_should_get_index
    get :index, :specification_id => 1
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  def test_should_get_show
    get :show, :specification_id => 1, :id => photos(:one).id
    assert_response :success
    assert_not_nil assigns(:photo)
  end

  def test_creates_new
    xml_http_request :post, :create, :specification_id => 1, :FileData=>""
   # assert_template "_flash_response"
    assert_response :success
  end

  def test_delete
    assert_difference('Photo.count', -1) do
      xml_http_request :delete, :destroy, :specification_id => 1, :id=> 1
    end
    assert_redirected_to specification_photos_path(1)
  end
end

class UnauthenticatedPhotosControllerTest < PhotosControllerTest
  tests PhotosController

  def setup
    super
    @request.env['HTTP_ACCEPT'] = 'application/xml'
  end

  def test_should_get_index
    get :index, :specification_id => 1
    assert_response :success
    assert_not_nil assigns(:photos)
    assert_equal @response.body, xml_photos_get
  end

  def test_should_get_show
    get :show, :specification_id => 1, :id => photos(:one).id
    assert_response :success
    assert_not_nil assigns(:photo)
    assert_equal @response.body, xml_photo_get
  end

  def test_should_not_create_new
  #  assert_no_difference('Photo.count') do
      xml_http_request :post, :create, :specification_id => 1, :FileData=>""
   # end
    assert_response 401
  end

  def test_no_delete
    assert_no_difference('Photo.count', -1) do
      xml_http_request :delete, :destroy, :specification_id => 1, :id=> 1
    end
    assert_response 401
  end
end

