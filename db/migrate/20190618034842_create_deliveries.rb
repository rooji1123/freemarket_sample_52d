class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :burden, nill: false
      t.integer :method, nill: false
      t.integer :region, nill: false
      t.integer :day, nill: false
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
