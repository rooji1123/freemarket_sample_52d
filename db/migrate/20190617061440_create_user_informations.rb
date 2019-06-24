class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.string      :last_name, null: false
      t.string      :first_name, null: false
      t.string      :last_name_kana, null: false
      t.string      :first_name_kana, null: false
      t.string      :birth_year, null: false
      t.string      :birth_month, null: false
      t.string      :birth_day, null: false
      t.string      :check_phone_number, null: false
      t.references  :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
