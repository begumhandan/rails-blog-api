require "test_helper"

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_comments_url
    assert_response :ok
  end

  test "should get show" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    comment = Comment.create!(content: "Test Comment", user: user, post: post)
    get api_v1_comment_url(comment)
    assert_response :ok
  end

  test "should create comment" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    post api_v1_comments_url, params: { 
      comment: { 
        content: "New Comment",
        user_id: user.id,
        post_id: post.id
      } 
    }
    assert_response :created
  end

  test "should update comment" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    comment = Comment.create!(content: "Test Comment", user: user, post: post)
    patch api_v1_comment_url(comment), params: { comment: { content: "Updated Comment" } }
    assert_response :ok
  end

  test "should destroy comment" do
    user = User.create!(name: "Test User", email: "test@example.com")
    category = Category.create!(name: "Test Category")
    post = Post.create!(title: "Test Post", content: "Test content", user: user, category: category)
    comment = Comment.create!(content: "Test Comment", user: user, post: post)
    delete api_v1_comment_url(comment)
    assert_response :no_content
  end
end