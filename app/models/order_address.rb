class OrderAddress
  include ActiveModel::Model
  #:user, :item, :orderはいらないかも
  attr_accessor :user_id, :item_id, :token, :order, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    #validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end