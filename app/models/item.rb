class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :prefecture_id
    validates :shipping_fee_status_id
    validates :scheduled_delivery_id
    validates :price
  end
end
