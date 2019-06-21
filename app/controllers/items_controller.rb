class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @selleritems = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @categoryitems = Item.where(category_id: @item.category_id).where.not(id: @item.id)
    @images = @item.item_images.where(params[:item_id])
  end

  def new
    @item = Item.new
    10.times { @item.item_images.build }
  end

  def create
     @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
          params[:item_images][:image].each do |image|
            @item.item_images.create(image: image, item_id: @item.id)
          end
        format.html{redirect_to root_path}
      else
        @item.item_images.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    
  end

 private

   def item_params
     params.require(:item).permit(:name, :description, :prefecture_id, :price, :delivery_date_id, :delivery_fee_id, :item_state_id, item_images_attributes: [:image])
   end
 end