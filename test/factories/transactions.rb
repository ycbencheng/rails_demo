require 'ffaker'

FactoryBot.define do
  factory :transaction do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end
end
