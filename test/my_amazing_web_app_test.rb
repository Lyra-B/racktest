require 'test/unit'
require 'rack/test'
require 'pry'
require_relative '../my_amazing_web_app'

class MovieServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    MyAmazingWebApp.new
  end

  def test_homepage
  	get '/'
    assert last_response.ok?
  end

  def test_any_other_page
  	get '/nonesuch'
  	assert_equal 404, last_response.status
  end
end