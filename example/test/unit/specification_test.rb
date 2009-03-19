require 'test_helper'
class SpecificationTest < ActiveSupport::TestCase

  def setup
    ######### specs
    matz  = { :id => 1, :manufacturer=>'manu1' }
    david  = { :id => 2, :manufacturer=>'manu2' }
    @spec = matz.to_xml(:root => 'specification')
    @specs = [matz, david].to_xml(:root => 'specifications')

    ######### photos
    matz  = { :id => 1, :full=>'hi', :thumb=>'foo' }
    david  = { :id => 2, :full=>'bobb' }
    @pic = matz.to_xml(:root => 'photo')
    @pics = [matz, david].to_xml(:root => 'photos')

    ActiveResource::HttpMock.respond_to do |mock|
      mock.get    "/specifications.xml", {}, @specs
      mock.get    "/specifications/1.xml", {}, @spec
      mock.get    "/specifications/1/photos.xml", {}, @pics
      mock.get    "/specifications/1/photos/1.xml", {}, @pic
    end
  end

  test "specification" do
    spec = Specification.find(1)
    assert_equal spec.manufacturer, 'manu1'
  end

  test "specifications" do
    specs = Specification.find(:all)
    assert_equal specs.size, 2
  end

  test "specification photos" do
    spec = Specification.find(1)
    pics = spec.photos
    assert_equal pics.size, 2
  end
end
