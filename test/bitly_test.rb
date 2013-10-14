require 'test/unit'
require 'rack/test'
require 'pry'
require_relative '../bitly_server'

class BitlyTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
  	BitlyServer.new
  end

  def test_homepage_works
  	get '/'
  	assert last_response.ok?
  end

  def test_a_short_url_maps_to_a_long_url
  	app.urls['xyz'] = "http://www.wegotcoders.com"

  	get '/xyz'
  	assert last_response.redirect?
  	follow_redirect!
  	assert_equal "http://www.wegotcoders.com", last_response.url
  end

  def test_a_missing_url_gives_404
  	get '/missing'
  	assert_equal 404, last_response.status
  end

  def test_setting_a_new_url_randomly_generates_a_url
  	short_url = app.add_url("http://www.wegotcoders.com")

  	get "/#{short_url}"
  	assert last_response.redirect?
  	follow_redirect!
  	assert_equal "http://www.wegotcoders.com", last_response.url
  end

  def test_adding_a_url_from_a_client
  	get "/add_url?url=http://www.wegotcoders.com"
  	assert last_response.ok?

  	generated_url = last_response.body
  	get generated_url
  	assert last_response.redirect?
  	follow_redirect!
  	assert_equal "http://www.wegotcoders.com", last_response.url
  end
end