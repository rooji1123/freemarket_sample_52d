class RemoveColumnFromUserCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_cards, :card_number, :integer
    remove_column :user_cards, :expiration_month, :integer
    remove_column :user_cards, :expiration_year, :integer
    remove_column :user_cards, :security_code, :integer
  end
end
