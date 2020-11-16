class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_user, only: %i[create show edit update]
  
  def index
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :prefecture_id, :shipping_fee_status_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_user
    @item = Item.find(params[:id])
  end
end
