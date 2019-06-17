class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :size
      t.string :item_state
      t.references :seller_id
      t.references :buyer_id
      t.references :brand
      t.references :category
      t.string :deal_state
      t.timestamps
    end
  end
end
