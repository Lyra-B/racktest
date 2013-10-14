require 'test/unit'
require 'rack/test'
require 'pry'
require_relative '../my_amazing_web_app'

class MyAmazingWebAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    MyAmazingWebApp.new
  end

  def test_homepage
  	get '/'
    assert last_response.ok?
  end

  def test_coolbeans_sets_the_title
    get '/coolbeans.html'
    assert_match(/coolbeans/, last_response.body)
  end

  def test_any_other_page
  	get '/nonesuch'
  	assert_equal 404, last_response.status
  end
end