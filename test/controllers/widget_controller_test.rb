require "test_helper"

class WidgetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get widget_index_url
    assert_response :success
  end

  test "should get show" do
    get widget_show_url
    assert_response :success
  end

  test "should get edit" do
    get widget_edit_url
    assert_response :success
  end

  test "should get update" do
    get widget_update_url
    assert_response :success
  end

  test "should get new" do
    get widget_new_url
    assert_response :success
  end

  test "should get create" do
    get widget_create_url
    assert_response :success
  end

  test "should get destroy" do
    get widget_destroy_url
    assert_response :success
  end
end
