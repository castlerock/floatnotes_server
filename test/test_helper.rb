require File.expand_path("../../boot", __FILE__)
require File.expand_path("../../app/floatnotes", __FILE__)
require 'test/unit'
require 'rack/test'
require "shoulda"
require "mocha"

class Test::Unit::TestCase

  def fixture_file(filename)
    IO.read(File.expand_path("../fixtures/#{filename}", __FILE__))
  end

  def json_response
    JSON.parse(last_response.body)
  end

  def assert_status(status)
    assert_equal status, last_response.status
  end
end
