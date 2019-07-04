class BrandsController < ApplicationController
  def index
  end

  def show
    @brands = Brand.find(params[:id])
    @items = @brands.items.includes(:item_images)
  end
end
