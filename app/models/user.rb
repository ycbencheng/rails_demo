class User < ApplicationRecord
  has_secure_password

  has_many :widgets, foreign_key: :seller_id
  has_many :buyer_transactions, class_name: 'Transaction', foreign_key: :buyer_id
  has_many :seller_transactions, class_name: 'Transaction', foreign_key: :seller_id

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

  def self.cal_new_deposit(user, new_fund)
    { deposit_amount: user.deposit_amount + new_fund[:deposit_amount].to_f }
  end

  def self.check_funding(user, price)
    user.deposit_amount - price > 0
  end
end
