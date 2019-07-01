crumb :root do
  link "メルカリ", root_path
end

crumb :categories do
  link "カテゴリー一覧", categories_path
end

# crumb :ladys_clothes do |child|
#   link child.name, category_path(category)
#   parent :categories
# end

crumb :category do |category|
  link category.name, category_path(category)
  parent :categories
end

# crumb :ladys_clothes do |child|
#   link child.name, category_path(category)
#   parent :categories
# end
# crumb :category.grand_children do |grand_child|
#   link grand_child.name, grand_child_path("")
#   parent :categories, category, category.children
# end
crumb :users do
  link "マイページ", users_path
end

crumb :items do 
  
  
  link "#{params[:q][:name_or_description_cont]}", search_items_path
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).