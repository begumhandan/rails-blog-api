require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_users_url
    assert_response :ok
  end

  test "should get show" do
    user = User.create!(name: "Test User", email: "test@example.com")
    get api_v1_user_url(user)
    assert_response :ok
  end

  test "should create user" do
    post api_v1_users_url, params: { user: { name: "New User", email: "new@example.com" } }
    assert_response :created
  end

  test "should update user" do
    user = User.create!(name: "Test User", email: "test@example.com")
    patch api_v1_user_url(user), params: { user: { name: "Updated User" } }
    assert_response :ok
  end

  test "should destroy user" do
    user = User.create!(name: "Test User", email: "test@example.com")
    delete api_v1_user_url(user)
    assert_response :no_content
  end
end
