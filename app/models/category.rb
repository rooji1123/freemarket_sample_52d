class Category < ApplicationRecord
  has_many :items
  has_many :items, through: :items_categories
  has_ancestry
end
