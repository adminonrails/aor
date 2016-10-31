require 'test_helper'

class Aor::Authentication::Test < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'test@test.com', password: 'pwdpwddwpdwp', password_confirmation: 'pwdpwddwpdwp')
  end

  test "#current_user_form_session= #current_user= #current_user #login_from_session" do
    post login_user_sessions_url, params: {email: 'test@test.com', password: 'bad'}
    assert_response :forbidden

    post login_user_sessions_url, params: {email: 'test@test.com', password: 'pwdpwddwpdwp'}
    assert_response :ok
    assert_equal @user.id, session[:user_id] 
  end

  test "#login_required #logged_in? #access_denied" do
    delete logout_user_sessions_url
    assert_response :forbidden

    post login_user_sessions_url, params: {email: 'test@test.com', password: 'pwdpwddwpdwp'}
    assert_response :ok

    delete logout_user_sessions_url
    assert_response :ok
    assert_equal nil, session[:user_id] 
  end
end
