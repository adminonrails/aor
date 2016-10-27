require 'test_helper'

class Aor::Bootstrap::Test < ActionDispatch::IntegrationTest
  test "check bootstrap css" do
    get '/assets/application.css'
    assert_response :success
    assert_match 'assets', @response.body
    assert_match 'woff', @response.body
  end

  test "check bootstrap js" do
    get '/assets/application.js'
    assert_response :success
    assert_match 'Bootstrap', @response.body
  end

  test "check bootstrap font" do
    %w[eot svg ttf woff woff2].each do |font_format|
      get "/assets/glyphicons-halflings-regular.#{font_format}"
      assert_response :success
    end
  end
end
