class AddIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :deal_state, :integer
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :item, foreign_key: true
  end
end
