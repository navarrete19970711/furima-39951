FactoryBot.define do
  factory :purchase_delivery_address do
    user_id { 1 }
    item_id { 1 }
    postal_code { Faker::Number.decimal_part(digits: 3) + "-" + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token { "pk_test_XXXXXXXX" }
  end
end
