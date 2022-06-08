class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
  belongs_to :seller, class_name: 'User', foreign_key: :seller_id
  belongs_to :widget

  def self.widget_to_transaction(widget, buyer)
    { seller_id: widget.seller_id,
      buyer_id: buyer.id,
      widget_id: widget.id,
      amount: widget.price }
  end
end
