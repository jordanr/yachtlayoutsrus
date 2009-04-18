require 'test_helper'
require 'search_helper'

class SearchHelperTest < ActiveSupport::TestCase
  include SearchHelper
  # Replace this with your real tests.
  test "raises no terms" do
    assert_raises(ArgumentError) do 
      make_sql([])
    end
  end
  test "raises many terms" do
    assert_raises(ArgumentError) do 
      make_sql(['a','b','c','d'])
    end
  end

  test "two" do
    sql = make_sql(['a','a'])
#    assert_equal ["SELECT photos.* FROM photos, specifications WHERE "+
    assert_equal ["(LOWER(manufacturer) LIKE ? OR LOWER(model) LIKE ? OR length = ?) AND "+
		  "(LOWER(manufacturer) LIKE ? OR LOWER(model) LIKE ? OR length = ?) AND "+
                  "photos.specification_id = specifications.id " +
		  "ORDER BY manufacturer, length DESC", "%a%", "%a%", 'a', "%a%", "%a%", 'a'], sql
  end
end

