class SoldItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id
  before_action :prevent_sold_item
  before_action :prevent_myindex
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

  # 売却済み商品の購入ページに遷移できない処理
  def prevent_sold_item
    # 購入テーブルに既に商品が含まれている（購入済み）か判定
    if @item.sold_item.present?
      redirect_to root_path
    end
  end

  # ログインユーザーが自分の商品購入ページにログインできない処理
  def prevent_myindex
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
