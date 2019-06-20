class CreateUserCards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cards do |t|
      t.integer     :card_number, null: false
      t.integer     :expiration_month, null: false
      t.integer     :expiration_year, null: false
      t.integer     :security_code, null: false
      t.references  :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
