class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
end
