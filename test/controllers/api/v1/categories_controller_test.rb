require "test_helper"

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_categories_url
    assert_response :ok
  end

  test "should get show" do
    category = Category.create!(name: "Test Category")
    get api_v1_category_url(category)
    assert_response :ok
  end

  test "should create category" do
    post api_v1_categories_url, params: { category: { name: "New Category", description: "Test description" } }
    assert_response :created
  end

  test "should update category" do
    category = Category.create!(name: "Test Category")
    patch api_v1_category_url(category), params: { category: { name: "Updated Category" } }
    assert_response :ok
  end

  test "should destroy category" do
    category = Category.create!(name: "Test Category")
    delete api_v1_category_url(category)
    assert_response :no_content
  end
end
