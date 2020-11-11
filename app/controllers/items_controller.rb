class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:user, :name, :info, :category_id, :sales_status_id, :prefecture_id, :shipping_fee_status_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
