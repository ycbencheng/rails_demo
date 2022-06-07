require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without first name' do
    @user.first_name = nil

    refute @user.valid?, 'user is valid without a first_name'
    assert_not_nil @user.errors[:first_name], 'no validation error for first name present'
  end

  test 'invalid without last name' do
    @user.last_name = nil

    refute @user.valid?, 'user is valid without a last_name'
    assert_not_nil @user.errors[:last_name], 'no validation error for last name present'
  end

  test 'invalid without password' do
    @user.password = nil

    refute @user.valid?, 'user is valid without a password'
    assert_not_nil @user.errors[:password], 'no validation error for password present'
  end

  test 'invalid without email' do
    @user.email = nil

    refute @user.valid?, 'user is valid without a email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end
end
