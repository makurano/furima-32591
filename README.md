# README

# テーブル設計
***
## usersテーブル
 
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| nickname            | string  | null: false |
| first_name          | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name           | string  | null: false |
| last_name_katakana  | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :sold_items
***
## itemsテーブル

| Column             | Type                | Options                         |
| ------------------ | ------------------- | ------------------------------- |
| name               | string              | null: false                     |
| explanation        | text                | null: false                     |
| category_id        | ActiveHash, integer | null: false, numericality: true |
| condition_id       | ActiveHash, integer | null: false, numericality: true |
| delivery_fee_id    | ActiveHash, integer | null: false, numericality: true |
| prefecture_id      | ActiveHash, integer | null: false, numericality: true |
| delivery_day_id    | ActiveHash, integer | null: false, numericality: true |
| price              | integer             | null: false                     |
| user               | references          | null: false, foreign_key: true  |

### Association

- belongs_to       :user
- has_one_attached :image
- has_one          :sold_item

- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition 
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee 
- extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_day
***
## sold_itemsテーブル

| Column          | Type                | Options                         |
| --------------- | ------------------- | ------------------------------- |
| item            | references          | null: false, foreign_key: true  |
| user            | references          | null: false, foreign_key: true  |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item
***
## addressesテーブル
| Column        | Type                | Options                         |
| ------------- | ------------------- | ------------------------------- |
| postal_code   | string              | null: false                     |
| prefecture_id | ActiveHash, integer | null: false, numericality: true |
| municipality  | string              | null: false                     |
| address       | string              | null: false                     |
| building_name | string              |                                 |
| phone_number  | string              | null: false                     |
| sold_item     | references          | null: false, foreign_key: true  |

### Association

- belongs_to :sold_item
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :prefecture
***
# ActiveHash

## category(ActiveHash)
- include ActiveHash::Associations
- has_many :items
## condition(ActiveHash)
- include ActiveHash::Associations
- has_many :items
## delivery_fee(ActiveHash)
- include ActiveHash::Associations
- has_many :items
## delivery_day(ActiveHash)
- include ActiveHash::Associations
- has_many :items
## prefecture(ActiveHash)
- include ActiveHash::Associations
- has_many :items
- include ActiveHash::Associations
- has_many :addresses
***
# ActiveStorage

## image(ActiveStorage)
***