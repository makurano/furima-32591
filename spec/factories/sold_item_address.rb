FactoryBot.define do
  factory :sold_item_address do
    association :user
    association :item
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
