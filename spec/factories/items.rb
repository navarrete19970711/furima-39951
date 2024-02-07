FactoryBot.define do
  factory :item do
    name                  {Faker::Game.platform}
    explain               {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    condition_id          {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id       {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.number(digits: 7)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_4187.jpeg'),filename: 'IMG_4187.jpeg')
    end

    association :user
  end
end
