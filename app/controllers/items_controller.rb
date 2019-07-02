class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:new]

  def index
    @ladies = ItemsCategory.where(category_id:"1").includes(:item)
    @mens = ItemsCategory.where(category_id:"2").includes(:item)
    @babys = ItemsCategory.where(category_id:"3").includes(:item)
    @cosme = ItemsCategory.where(category_id:"7").includes(:item)
  end

  def show
    @item = Item.find(set_item)
    @selleritems = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @categoryitems = ItemsCategory.where(category_id: @item.items_categories.last.category_id).includes(:item)
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
    @item = Item.find(set_item)
    @item.item_images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def update
    @item = Item.find(set_item)
    @item.update(item_params)
    @item.item_images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def destroy
  end

  def search
    @q = Item.ransack(params[:q])
    @categories = Category.where(ancestry: nil)
    @item_state = ItemState.all
    @delivery_fee = DeliveryFee.all
    @result = @q.result(distinct: true)
    @result = @result.page(params[:page]).per(20)
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
    brand_id = params[:brand_id].to_i
    params.require(:item).permit(:name, :description, :prefecture_id, :price, :delivery_date_id, :delivery_fee_id, :delivery_choice_id, :brand_id, :item_state_id, :size_id, category_ids: [], images: []).merge(brand_id: brand_id)
  end

  def set_item
    params.require(:id)
  end

end