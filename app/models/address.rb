class Address < ApplicationRecord
  belongs_to :sold_item
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :prefecture

  with_options presence: true do
    # ３桁-４桁の正規表現
    validates :postal_code format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :municipality
    validates :address
    # 数字だけの正規表現
    validates :phone_number format: { with: /\A\d{11}\z/, message: 'Input only number' }
  end

end
