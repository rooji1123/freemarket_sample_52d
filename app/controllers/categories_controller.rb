class CategoriesController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end
end
