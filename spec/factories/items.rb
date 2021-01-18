FactoryBot.define do
  factory :item do
    name                 {Gimei.kanji}
    explanation          {Gimei.kanji}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    state_id             {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id      {Faker::Number.between(from: 2, to: 3)}
    shipping_place_id    {Faker::Number.between(from: 2, to: 48)}
    day_id               {Faker::Number.between(from: 2, to: 4)}
    price                {Faker::Number.between(from: 300, to: 9999999)}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end