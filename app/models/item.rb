class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # 商品購入履歴テーブル導入時に実装する
  # has_one :sold_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  # ここからバリデーション
  with_options presence: true do
    with_options numericality: { other_than: 0, message: 'select' } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end

    validates :name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
