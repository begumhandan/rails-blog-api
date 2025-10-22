require "test_helper"

class Api::V1::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tags_url
    assert_response :ok
  end

  test "should get show" do
    tag = Tag.create!(name: "Test Tag")
    get api_v1_tag_url(tag)
    assert_response :ok
  end

  test "should create tag" do
    post api_v1_tags_url, params: { tag: { name: "New Tag" } }
    assert_response :created
  end

  test "should update tag" do
    tag = Tag.create!(name: "Test Tag")
    patch api_v1_tag_url(tag), params: { tag: { name: "Updated Tag" } }
    assert_response :ok
  end

  test "should destroy tag" do
    tag = Tag.create!(name: "Test Tag")
    delete api_v1_tag_url(tag)
    assert_response :no_content
  end
end