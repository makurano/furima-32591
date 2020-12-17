class SoldItemsController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  def index
    @sold_item_address = SoldItemAddress.new
  end

  def create
    @sold_item_address = SoldItemAddress.new(sold_item_params)
        if @sold_item_address.valid?
          pay_item
          @sold_item_address.save
          return redirect_to root_path
        else
          render action: :index
        end
  end

  private

  def sold_item_params
    params.require(:sold_item_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      # paramsの名前はストロングパラメーターのメソッド名
      card: sold_item_params[:token],
      currency: 'jpy'
    )
  end

end
