require 'test_helper.rb'

class LlApiTest < ActionController::IntegrationTest
  
  test "gets specs" do
    get '/', {:method=>'specifications_get'}, { :HTTP_ACCEPT => 'application/xml' }
    assert_response :redirect
    follow_redirect!
    assert_equal @response.body, xml_specs_get
  end
  test "gets spec" do
    get '/', {:method=>'specification_get', :id=>1 }, { :HTTP_ACCEPT => 'application/xml' }
    assert_response :redirect
    follow_redirect!
    assert_equal @response.body, xml_spec_get
  end
  test "gets photos" do
    get '/', {:method=>'specification_photos_get', :specification_id=>1}, { :HTTP_ACCEPT => 'application/xml' }
    assert_response :redirect
    follow_redirect!
    assert_equal @response.body, xml_photos_get
  end
  test "gets photo" do
    get '/', { :method=>'specification_photo_get', :specification_id=>1, :id=>1 }, { :HTTP_ACCEPT => 'application/xml' }
    assert_response :redirect
    follow_redirect!
    assert_equal @response.body, xml_photo_get
  end
end
