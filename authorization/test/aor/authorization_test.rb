require 'test_helper'

class Aor::Authorization::Test < ActionDispatch::IntegrationTest
  test "admin role" do
    get admin_articles_url, params: {user: :admin}
    assert_response :ok

    get admin_article_url(1), params: {user: :admin}
    assert_response :ok
  end

  test "manager role" do
    get admin_articles_url, params: {user: :manager}
    assert_response :ok

    get admin_article_url(1), params: {user: :manager}
    assert_response :forbidden
  end
end
