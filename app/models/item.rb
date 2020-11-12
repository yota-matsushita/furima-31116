class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :prefecture_id
    validates :shipping_fee_status_id
    validates :scheduled_delivery_id
  end
end
