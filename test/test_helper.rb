ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class Test::Unit::TestCase
  # Transactional fixtures accelerate your tests by wrapping each test method
  # in a transaction that's rolled back on completion.  This ensures that the
  # test database remains unchanged so your fixtures don't have to be reloaded
  # between every test method.  Fewer database queries means faster tests.
  #
  # Read Mike Clark's excellent walkthrough at
  #   http://clarkware.com/cgi/blosxom/2005/10/24#Rails10FastTesting
  #
  # Every Active Record database supports transactions except MyISAM tables
  # in MySQL.  Turn off transactional fixtures in this case; however, if you
  # don't care one way or the other, switching from MyISAM to InnoDB tables
  # is recommended.
  #
  # The only drawback to using transactional fixtures is when you actually 
  # need to test transactions.  Since your test is bracketed by a transaction,
  # any transactions started in your code will be automatically rolled back.
  self.use_transactional_fixtures = true

  # Instantiated fixtures are slow, but give you @david where otherwise you
  # would need people(:david).  If you don't want to migrate your existing
  # test cases which use the @david style and don't mind the speed hit (each
  # instantiated fixtures translates to a database query per test method),
  # then set this back to true.
  self.use_instantiated_fixtures  = false

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def set_basic_authentication
    up = "test:test"
    @request.env["HTTP_AUTHORIZATION"] = "Basic #{Base64.encode64(up)}"
  end


  def xml_specs_get
    '<?xml version="1.0" encoding="UTF-8"?>
<specifications type="array">
  <specification>
    <id type="integer">1</id>
    <length type="integer">1</length>
    <manufacturer>MyString</manufacturer>
    <model>MyString</model>
    <year type="integer">1</year>
    <thumb>'+HOST+'/photos/0000/0001/MyString_thumb</thumb>
  </specification>
  <specification>
    <id type="integer">2</id>
    <length type="integer">1</length>
    <manufacturer>MyString</manufacturer>
    <model>MyString</model>
    <year type="integer">1</year>
    <thumb>'+HOST+'/images/main_silhouette.gif</thumb>
  </specification>
</specifications>
'
  end

  def xml_spec_get
    '<?xml version="1.0" encoding="UTF-8"?>
<specification>
  <ballast>1</ballast>
  <beam>1</beam>
  <bridge-clearance>1</bridge-clearance>
  <created-at type="datetime">2009-03-16T20:45:40Z</created-at>
  <cruise-speed>1</cruise-speed>
  <description nil="true"></description>
  <designer>MyString</designer>
  <displacement>1</displacement>
  <engine-fuel>MyString</engine-fuel>
  <engine-horsepower>1</engine-horsepower>
  <engine-manufacturer>MyString</engine-manufacturer>
  <engine-model>MyString</engine-model>
  <engine-year type="integer">1</engine-year>
  <fuel-tanks nil="true"></fuel-tanks>
  <holding-tanks nil="true"></holding-tanks>
  <hull-material>MyString</hull-material>
  <id type="integer">1</id>
  <length type="integer">1</length>
  <loa>1</loa>
  <lod nil="true"></lod>
  <lwl>1</lwl>
  <manufacturer>MyString</manufacturer>
  <max-draft>1</max-draft>
  <max-speed>1</max-speed>
  <min-draft>1</min-draft>
  <model>MyString</model>
  <number-of-engines type="integer">1</number-of-engines>
  <updated-at type="datetime">2009-03-16T20:45:40Z</updated-at>
  <water-tanks nil="true"></water-tanks>
  <year type="integer">1</year>
  <full>'+HOST+'/photos/0000/0001/MyString</full>
</specification>
'
  end


  def xml_photos_get
    '<?xml version="1.0" encoding="UTF-8"?>
<photos type="array">
  <photo>
    <id type="integer">1</id>
    <specification-id type="integer">1</specification-id>
    <full>'+HOST+'/photos/0000/0001/MyString</full>
    <thumb>'+HOST+'/photos/0000/0001/MyString_thumb</thumb>
  </photo>
  <photo>
    <id type="integer">2</id>
    <specification-id type="integer">1</specification-id>
    <full>'+HOST+'/photos/0000/0001/MyString</full>
    <thumb>'+HOST+'/photos/0000/0001/MyString_thumb</thumb>
  </photo>
</photos>
'
  end
 
  def xml_photo_get
    '<?xml version="1.0" encoding="UTF-8"?>
<photo>
  <created-at type="datetime">2009-03-16T21:33:14Z</created-at>
  <filename>MyString</filename>
  <id type="integer">1</id>
  <specification-id type="integer">1</specification-id>
  <updated-at type="datetime">2009-03-16T20:45:40Z</updated-at>
  <full>'+HOST+'/photos/0000/0001/MyString</full>
  <thumb>'+HOST+'/photos/0000/0001/MyString_thumb</thumb>
</photo>
'
  end

end

module AuthenticationTestHelper
#  def self.included(klass)
#    klass.extend ClassMethods
#  end

#  module ClassMethods
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "test" && password == "test"
      end
    end
#  end
end

