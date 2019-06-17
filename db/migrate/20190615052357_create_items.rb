class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, null: true
      t.text    :description, null: true
      t.string  :item_state_id, null: true
      t.string  :delivery_fee_id, null: true
      t.string  :prefecture_id, null: true
      t.string  :delivery_date_id, null: true  
      t.integer :price, null: true
      t.timestamps
    end
  end
end
