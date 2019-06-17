class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @selleritems = Item.where(seller_id_id: @item.seller_id_id).where.not(id: @item.id)
    @categoryitems = Item.where(category_id: @item.category_id).where.not(id: @item.id)
    @images = @item.images.where(params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_item_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private

   def item_params
     params.require(:item).permit(:name)
   end
 end