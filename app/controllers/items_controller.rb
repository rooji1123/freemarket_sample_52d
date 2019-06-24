class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(set_item)
    @selleritems = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    # @categoryitems = Item.where(category_id: categories.category_id).where.not(id: @item.id)
    @images = @item.item_images.where(params[:item_id])
  end

  def new
    @item = Item.new
    @item.item_images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
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
  
  def category_search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        else
          @grand_children = Category.find(params[:child_id]).children
        end
      end
    end
  end

  def brand_search
    unless params[:keyword].nil? || params[:keyword].empty?
      @brands = Brand.where('name LIKE :name', name:"%#{params[:keyword].tr('ぁ-ん','ァ-ン')}%")
      respond_to do |format|
        format.json
      end
    end
  end

 private

  def item_params
    params.require(:item).permit(:name, :description, :prefecture_id, :price, :delivery_date_id, :brand_id, :delivery_fee_id, :delivery_choice_id, :item_state_id, :size_id, item_images_attributes: [:image], category_ids: [])
  end

  def set_item
    params.require(:id)
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end
  
end

