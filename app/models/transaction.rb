class Transaction < ApplicationRecord
  after_create :update_users_deposit

  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  belongs_to :widget

  validates :amount, presence: :true

  def self.widget_to_transaction(widget, buyer)
    { seller_id: widget.seller_id,
      buyer_id: buyer.id,
      widget_id: widget.id,
      amount: widget.price }
  end

  def update_users_deposit
    # add money to seller
    seller.update(deposit_amount: seller.deposit_amount + amount)

    # subtract money from buyer
    buyer.update(deposit_amount: buyer.deposit_amount - amount)
  end
end
