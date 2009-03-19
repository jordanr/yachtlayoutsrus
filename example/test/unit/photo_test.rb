require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  def setup
    matz  = { :id => 1, :full=>'hi', :thumb=>'foo' }
    david  = { :id => 2, :full=>'bobb' }
    @pic = matz.to_xml(:root => 'photo')
    @pics = [matz, david].to_xml(:root => 'photos')

    ActiveResource::HttpMock.respond_to do |mock|
      mock.get    "/specifications/1/photos.xml", {}, @pics
      mock.get    "/specifications/1/photos/1.xml", {}, @pic
    end
  end

  test "photo" do
    pic = Photo.find_by_id_and_specification(1, 1)
    assert_equal pic.full, 'hi' 
  end

  test "photos" do
    pics = Photo.find_by_specification(1)
    assert_equal pics.size, 2
  end

end

