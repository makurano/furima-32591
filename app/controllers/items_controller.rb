class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :prevent_edit, only: [:edit, :update, :destroy]
  before_action :prevent_sold_item, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def prevent_sold_item
    if @item.sold_item.present?
      redirect_to root_path
    end
  end
end
