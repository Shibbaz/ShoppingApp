require "faker"
FactoryBot.define do
  factory :item do
    name { Faker::Book.title }
    description { "book" }
    price { Faker::Number.number(digits: 2) }
    quantity { Faker::Number.number(digits: 1) }
    status { true }
  end
end
