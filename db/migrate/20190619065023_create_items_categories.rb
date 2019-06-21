class CreateItemsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :items_categories do |t|
      t.integer  :item_id
      t.integer  :category_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
