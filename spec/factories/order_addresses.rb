FactoryBot.define do
  factory :order_address do
    
    post_number     { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    municipality    { Gimei.city.kanji }
    address         { Gimei.town.kanji }
    building        { Gimei.town.kanji }
    phone_number    { Faker::Number.number(digits: 11) }
    token           {"tok_abcdefghijk00000000000000000"}

    user_id         {Faker::Number.within(range: 1..100)}
    item_id         {Faker::Number.within(range: 1..100)}

  end
end
