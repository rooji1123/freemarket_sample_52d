class Item < ApplicationRecord
  # validates :name, :description, :price, presence: true
  # validates :name,         length: { maximum: 40 }
  # validates :price,        length: { in: 300..9999999 } 
  # validates :description, length: { maximum: 1000 }
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :item_state
end
