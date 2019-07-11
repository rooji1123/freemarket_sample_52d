class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_deal, except: :purchase
  before_action :point_exist, only: :create

  Payjp.api_key = 'sk_test_833ebfb77824020c76ea83f0'
  def new
    @item = set_item
    card_data = Payjp::Customer.retrieve(current_user.user_card.customer_id)
    @card = {
      last4: card_data[:cards][:data][0][:last4],
      exp_month: card_data[:cards][:data][0][:exp_month],
      exp_year: card_data[:cards][:data][0][:exp_year],
      brand: card_data[:cards][:data][0][:brand]
    }
    @address = current_user.user_address
    @image = @item.item_images.find_by(params[:item_id])
    @information = current_user.user_information
    @point_all = user_point
  end

  def create
    item = set_item
    price = set_price
    begin
      if params[:price] != "0"
        Payjp::Charge.create(
          amount: price,
          customer: current_user.user_card.customer_id,
          currency: 'jpy'
        )
      end
      item.update(buyer_id: current_user.id, deal_state: 3)
      if params[:point]
        Point.create(user_id: current_user.id, point: 0 - params[:point].to_i)
      end
      Point.create(user_id: item.seller_id, point: item.price - item.price / 10)
    rescue
      redirect_to  purchase_item_purchases_path(params[:item_id]), flash: { error: "クレジットカード情報に誤りがあります。"}
    end
  end

  def user_point
    point_all = 0
    points = current_user.points
    unless points.empty?
      points.each do |point|
        point_all += point.point
      end
    end
    return point_all
  end

  def point_exist
    if params[:point]
      point = user_point
      if point == 0
        redirect_to  purchase_item_purchases_path(params[:item_id]), flash: { error: "ポイントでの購入に失敗しました"}
      end
    end
  end


  def purchase
    @item = set_item
  end

  def set_item
    item = Item.find(params[:item_id])
  end

  def item_deal
    item = set_item
    if item.deal_state != 1
      redirect_to  purchase_item_purchases_path(params[:item_id]), flash: { error: "選択された商品はすでに売り切れ、または購入できない状態となっています。"}
    elsif item.seller_id == current_user.id
      redirect_to  purchase_item_purchases_path(params[:item_id]), flash: { error: "出品者が商品を購入することはできません。"}
    end
  end

  private

  def set_price
    price = params.permit(:price)
    return price[:price]
  end
end
