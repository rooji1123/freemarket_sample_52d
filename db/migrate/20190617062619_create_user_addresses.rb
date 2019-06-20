class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string      :last_name_address, null: false
      t.string      :first_name_address, null: false
      t.string      :last_name_kana_address, null: false
      t.string      :first_name_kana_address, null: false
      t.string      :postal_code, null: false
      t.integer     :country_id, null:false
      t.string      :city, null: false
      t.string      :address, null: false
      t.string      :building_name, null: true
      t.string      :phone_number, null: true
      t.references  :user,  foreign_key: true, null: false
      t.timestamps
    end
  end
end
