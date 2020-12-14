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
# can't be blankは元の処理とダブる可能性があるので要検証
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefenture_id
      validates :delivery_day_id
    end
    
    validates :name
    validates :explanation
    # messageは設定しなくて良いかもしれない。これはオブジェクトの記述。ActiveRecordが範囲外を検知すると勝手に出すかもしれない。
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :image
  end
end
