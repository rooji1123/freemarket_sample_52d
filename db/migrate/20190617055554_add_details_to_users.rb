class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :introduction, :text, null: true
    add_column :users, :avoter, :string, null: true
  end
end
