class LikesController < ApplicationController
  before_action :set_variables
  def create
    Like.create(like_params)
    like_count = @item.likes.count
    @item = {item: @item.id, count: like_count}
    respond_to do |format|
      format.json
    end
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy
    like_count = @item.likes.count
    @item = {item: @item.id, count: like_count}
    respond_to do |format|
      format.json
    end
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
  end

  def like_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end
