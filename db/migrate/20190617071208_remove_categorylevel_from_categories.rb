class RemoveCategorylevelFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :Categorylevel, :string
  end
end
