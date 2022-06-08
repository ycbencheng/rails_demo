require "test_helper"

class WidgetTest < ActiveSupport::TestCase
  def setup
    @widget = FactoryBot.create(:widget)
  end

  test 'valid widget' do
    assert @widget.valid?
  end

  test 'invalid without title' do
    @widget.title = nil

    refute @widget.valid?, 'widget is valid without title'
    assert_not_nil @widget.errors[:title], 'no validation error for title present'
  end

  test 'invalid without description' do
    @widget.description = nil

    refute @widget.valid?, 'widget is valid without description'
    assert_not_nil @widget.errors[:description], 'no validation error for description present'
  end

  test 'invalid without seller' do
    @widget.seller_id = nil

    refute @widget.valid?, 'widget is valid without seller'
    assert_not_nil @widget.errors[:seller_id], 'no validation error for seller present'
  end
end
