require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = FactoryBot.create(:transaction)
  end

  test 'valid transaction' do
    assert @transaction.valid?
  end

  test 'invalid without seller' do
    @transaction.seller_id = nil

    refute @transaction.valid?, 'widget is valid without seller'
    assert_not_nil @transaction.errors[:seller_id], 'no validation error for seller present'
  end

  test 'invalid without buyer' do
    @transaction.buyer_id = nil

    refute @transaction.valid?, 'widget is valid without buyer'
    assert_not_nil @transaction.errors[:buyer_id], 'no validation error for buyer present'
  end

  test 'invalid without widget' do
    @transaction.widget_id = nil

    refute @transaction.valid?, 'widget is valid without widget'
    assert_not_nil @transaction.errors[:widget_id], 'no validation error for widget present'
  end

  test 'invalid without amount' do
    @transaction.amount = nil

    refute @transaction.valid?, 'widget is valid without amount'
    assert_not_nil @transaction.errors[:amount], 'no validation error for amount present'
  end
end
