class ItemsController < ApplicationController
  def index
  end

  def show
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