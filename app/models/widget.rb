class Widget < ApplicationRecord
  belongs_to :user, foreign_key: :seller_id

  validates :description, :price, presence: true
end
