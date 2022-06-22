require "test_helper"

class WidgetControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = FactoryBot.create(:user)
    signin_as(user)

    widget = FactoryBot.create(:widget)
    @widget = {widget: {id: widget.id,
                        seller_id: user.id,
                        title: widget.title,
                        description: widget.description,
                        price: widget.price}}
  end

  test "should get index" do
    get widget_index_url
    assert_response :success
  end

  test "should get new" do
    get new_widget_url
    assert_response :success
  end

  test "should get create" do
    post widget_index_url(@widget)
    assert_response :success
  end

  test "should get edit if user matches" do
    get edit_widget_path(@widget[:widget][:id])
    assert_response :redirect
  end

  test "should not get edit if user does not match" do
    @widget[:widget][:seller_id] = nil
    get edit_widget_path(@widget[:widget][:id])
    assert_response :redirect
  end
end
