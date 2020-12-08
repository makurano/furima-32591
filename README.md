# README

# テーブル設計
***
## usersテーブル
 
| Column              | Type    | Options     |
| email               | string  | null: false |
| password            | string  | null: false |
| nickname            | string  | null: false |
| first_name          | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name           | string  | null: false |
| last_name_katakana  | string  | null: false |
| birthday_year       | integer | null: false |
| birthday_month      | integer | null: false |
| birthday_day        | integer | null: false |

### Association

- has_many :items
- has_many :sold_items
***
## itemsテーブル

| Column             | Type                | Options                         |
| image              | ActiveStorage       | null: false                     |
| name               | string              | null: false                     |
| explanation        | text                | null: false                     |
| category_id        | ActiveHash, integer | null: false, numericality: true |
| condition_id       | ActiveHash, integer | null: false, numericality: true |
| delivery_dee_id    | ActiveHash, integer | null: false, numericality: true |
| prefecture_id      | ActiveHash, integer | null: false, numericality: true |
| delivery_day_id    | ActiveHash, integer | null: false, numericality: true |
| price              | integer             | null: false                     |
| user_id            | reference           | null: false, foreign_key: true  |

### Association
- belongs_to       :user
- has_one_attached :image
- has_one          :sold_item

- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :category
- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :condition 
- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :prefecture
- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :delivery_fee 
- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :delivery_day
***
## sold_itemsテーブル

| Column          | Type                | Options|
| item_id         | reference           | null: false, foreign_key: true  |
| card_number     | integer             | null: false                     |
| expiration_math | integer             | null: false                     |
| expiration_year | integer             | null: false                     |
| security_code   | integer             | null: false                     |
| postal_code     | string              | null: false                     |
| prefecture_id   | ActiveHash, integer | null: false, numericality: true |
| municipality    | string              | null: false                     |
| address         | text                | null: false                     |
| building_name   | text                |                                 |
| phone_number    | integer             | null: false                     |
| buyer_user_id   | reference           | null: false, foreign_key: true  |
| seller_user_id  | reference           | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- extend ActiveHash::Associations::ActiveRecordExtentions
- belongs_to :prefecture

***
# ActiveHash

## category(active_hash)
- include ActiveHash::Associations
- has_many :items
## condition(active_hash)
- include ActiveHash::Associations
- has_many :items
## delivery_fee(active_hash)
- include ActiveHash::Associations
- has_many :items
## delivery_day(active_hash)
- include ActiveHash::Associations
- has_many :items
## prefecture(active_hash)
- include ActiveHash::Associations
- has_many :items
- include ActiveHash::Associations
- has_many :sold_items
***