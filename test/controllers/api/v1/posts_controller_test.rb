require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_posts_url
    assert_response :ok
  end

  test "should get show" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    get api_v1_post_url(post)
    assert_response :ok
  end

  test "should create post" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post api_v1_posts_url, params: { 
      post: { 
        title: "New Post", 
        content: "New content",
        user_id: user.id,
        category_id: category.id
      } 
    }
    assert_response :created
  end

  test "should update post" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    patch api_v1_post_url(post), params: { post: { title: "Updated Post" } }
    assert_response :ok
  end

  test "should destroy post" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    delete api_v1_post_url(post)
    assert_response :no_content
  end
end