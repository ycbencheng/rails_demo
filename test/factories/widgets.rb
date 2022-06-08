

FactoryBot.define do

  factory :widget do
    association :user

    title { FFaker::Product.product_name }
    description { FFaker::FreedomIpsum.paragraph }
    price { (FFaker::Number.decimal * 4.5).round(2) }
    seller_id { user.id }
  end
end


