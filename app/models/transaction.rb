class Transaction < ApplicationRecord
  after_create :cal_financials

  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  belongs_to :widget

  validates :amount, presence: :true

  FEE = 0.05

  def self.widget_to_transaction(widget, buyer)
    { seller_id: widget.seller_id,
      buyer_id: buyer.id,
      widget_id: widget.id,
      amount: widget.price }
  end

  def cal_financials
    seller_income
    buyer_expense
    marketplace_revenue
  end

  def seller_income
    sub_total = (seller.deposit_amount + amount)
    total = sub_total - (sub_total * FEE)
    seller.update(deposit_amount: total)
  end

  def buyer_expense
    sub_total = (buyer.deposit_amount - amount)
    total = sub_total + (sub_total * FEE)
    buyer.update(deposit_amount: total)
  end

  def marketplace_revenue
    Marketplace.create(transaction_id: id, revenue: amount * FEE)
  end
end
