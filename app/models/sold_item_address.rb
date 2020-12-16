class SoldItemAddress
  include ActiveModel::Model
  # user_idとitem_idは不要かもしれない
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number

  # 元はaddressモデルのバリデーション
  with_options presence: true do
    # ３桁-４桁の正規表現
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'select' }
    validates :municipality
    validates :address
    # 数字だけの正規表現
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
  end

  def save
    sold_item = SoldItem.create( user_id: current_user.id, item_id: Item.find(params[:id]) )
    address = Address.create( postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, sold_item_id: sold_item.id )
  end


end