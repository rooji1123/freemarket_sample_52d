class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, index: true
      t.text        :description, nill: false
      t.integer     :price, nill: false
      t.integer     :size_id , default: 0, null: false
      t.integer     :item_state
      t.integer     :brand_id, null:true
      t.references  :seller, null: true
      t.references  :buyer, null: true
      t.integer     :likes, nill: true
      t.references  :brand, null: true
      t.integer     :deal_state
      t.string      :item_state_id, null: false
      t.string      :delivery_fee_id, null: false
      t.string      :prefecture_id, null: false
      t.string      :delivery_date_id, null: false
      t.string      :delivery_choice_id, null:false
      t.timestamps
    end
  end
end
