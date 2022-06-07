FactoryBot.define do
  factory :widget do
    user { nil }
    description { "MyText" }
    price { 1.5 }
  end
end
