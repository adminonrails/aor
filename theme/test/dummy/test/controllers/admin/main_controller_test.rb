require 'test_helper'

class Admin::MainControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admin_main_login_url
    assert_response :success
  end

end
