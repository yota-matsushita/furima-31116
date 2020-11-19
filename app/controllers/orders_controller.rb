class OrdersController < ApplicationController

  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    #binding.pry
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
      pay_item
       @order_address.save
       redirect_to root_path
     else
       render :index
     end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: (params[:item_id]), token: (params[:token]))
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
