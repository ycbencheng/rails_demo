require 'ffaker'

FactoryBot.define do
  factory :transaction do
    association :widget

    seller_id { create(:user).id }
    buyer_id { create(:user).id }
    widget_id { widget.id }
    amount { widget.price }
  end
end
