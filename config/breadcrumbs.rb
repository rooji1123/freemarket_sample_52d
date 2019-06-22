crumb :root do
  link "メルカリ", root_path
end

crumb :categories do
  link "カテゴリー一覧", categories_path
end

# crumb :category do |category|
#   link "#{category.name}", category_path("")
#   parent :categories
# end

# crumb :category.children do |child|
#   link "#{child.name}", category.children_path("")
#   parent :categories, category
# end

# crumb :category.grand_children do |grand_child|
#   link grand_child.name, grand_child_path("")
#   parent :categories, category, category.children
# end


crumb :items do
  link "#{params[:keyword]}", search_items_path
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).