class ItemsController < ApplicationController
  def index
  end

  def show
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

 private

   def item_params
     params.require(:item).permit(:name, :description, :prefecture_id, :price, :delivery_date_id, :delivery_fee_id, :item_state_id, item_images_attributes: [:image])
   end
 end