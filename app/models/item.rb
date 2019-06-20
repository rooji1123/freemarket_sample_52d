class Item < ApplicationRecord
  # validates :name, :description, :price, presence: true
  # validates :name,         length: { maximum: 40 }
  # validates :price,        length: { in: 300..9999999 } 
  # validates :description, length: { maximum: 1000 }
  has_many   :comments, dependent: :destroy
  has_many   :item_images, dependent: :destroy
  has_one    :delivery, dependent: :destroy
  has_many :items_categories, dependent: :destroy
  has_many :categories, through: :items_categories
  accepts_nested_attributes_for :item_images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_choice
  belongs_to_active_hash :size
  belongs_to_active_hash :item_state
end
