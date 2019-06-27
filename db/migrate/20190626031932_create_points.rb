class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.integer :point, null: false
      t.string :expiration_date
      t.timestamps
    end
  end
end
