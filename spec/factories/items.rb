FactoryBot.define do
  factory :item do
    name            { '商品名' }
    explanation     { 'これは商品の説明です' }
    category_id     { Faker::Number.between(from: 1, to: 10) }
    condition_id    { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    delivery_day_id { Faker::Number.between(from: 1, to: 3) }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
