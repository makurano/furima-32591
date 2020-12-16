class SoldItemsController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  def index
    # binding.pry
    @sold_item_address = SoldItemAddress.new
    # @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    # @item = Item.find(params[:item_id])
    @sold_item_address = SoldItemAddress.new(sold_item_params)
    binding.pry
        if @sold_item_address.valid?
          @sold_item_address.save
          return redirect_to root_path
        else
          render action: :index
        end
  end

  private

  def sold_item_params
    params.require(:sold_item_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

end
