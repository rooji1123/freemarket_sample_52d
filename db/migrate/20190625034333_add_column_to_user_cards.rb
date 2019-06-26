class AddColumnToUserCards < ActiveRecord::Migration[5.2]
  def change
    add_column :user_cards, :customer_id, :string
  end
end
