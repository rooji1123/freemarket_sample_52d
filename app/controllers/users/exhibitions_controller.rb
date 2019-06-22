class Users::ExhibitionsController < ApplicationController
  def index
    @items = Item.where(seller_id: 1)
  end

  def show
    @item = Item.find(set_item)
    @selleritems = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    # @categoryitems = Item.where(category_id: categories.category_id).where.not(id: @item.id)
    @images = @item.item_images.where(params[:id])
  end

  def edit
    
  end

  private

  def set_item
    params.require(:id)
  end
end
