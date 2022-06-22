require "test_helper"

class TransactionControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = FactoryBot.create(:user)
    signin_as(user)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end
end
