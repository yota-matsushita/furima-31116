class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.order('id DESC')
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

  def show
  end

  def edit
    if current_user.id == @item.user_id && @item.order.blank?
      redirect_to root_path unless current_user == @item.user
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    current_user == @item.user
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :prefecture_id, :shipping_fee_status_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
