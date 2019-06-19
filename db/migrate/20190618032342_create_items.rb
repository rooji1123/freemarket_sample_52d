class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.text :description, nill: false
      t.integer :price, nill: false
      t.integer :size , nill: false
      t.integer :item_state
      t.references :seller, null: true
      t.references :buyer, null: true
      t.integer :likes, nill: true
      t.references :brand, null: true
      t.references :category, null: true
      t.integer :deal_state
      t.timestamps
    end
  end
end
