require 'test_helper'

class Specification
 
  def method_missing(*args)
    "nil"
  end
end

class WelcomeControllerTest < ActionController::TestCase
  def setup
    ######### specs
    matz  = { :id => 1, :manufacturer=>'manu1', :model=>"", :length=>"1"}
    david  = { :id => 2, :manufacturer=>'manu2', :model=>"", :length=>"2" }
    @spec = matz.to_xml(:root => 'specification')
    @specs = [matz, david].to_xml(:root => 'specifications')

    ######### photos
    matz  = { :id => 1, :full=>'hi', :thumb=>'foo' }
    david  = { :id => 2, :full=>'bobb', :thumb=>"bar" }
    @pic = matz.to_xml(:root => 'photo')
    @pics = [matz, david].to_xml(:root => 'photos')

    ActiveResource::HttpMock.respond_to do |mock|
      mock.get    "/specifications.xml", {}, @specs
      mock.get    "/specifications/1.xml", {}, @spec
      mock.get    "/specifications/1/photos.xml", {}, @pics
      mock.get    "/specifications/1/photos/1.xml", {}, @pic
    end
  end

  # Replace this with your real tests.
  test "gets index" do
    get :index
    assert assigns(:specs)
  end

  test "responds to ajax" do
    xhr :get, :show_spec, :specification_id=>1
    assert assigns(:specification)
    assert assigns(:photos)
  end
end