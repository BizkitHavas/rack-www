require "helper"

class FalseWWW < TestClass
  def setup
    self.app = Rack::WWW.new(default_app, :www => false)
  end

  def test_www_false
    get "http://www.example.com/"
    assert_equal "http://example.com/", last_response.headers['Location']
  end

  def test_www_false_with_path
    get "http://www.example.com/path/1"
    assert_equal "http://example.com/path/1", last_response.headers['Location']
  end

  def test_www_false_with_query
    get "http://www.example.com/path/1?param=test"
    assert_equal "http://example.com/path/1?param=test", last_response.headers['Location']
  end

  def test_www_false_non_www
    get "http://example.com/"
    assert last_response.ok?
  end
end
