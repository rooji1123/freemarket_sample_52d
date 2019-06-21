class PurchasesController < ApplicationController
  def new
    @item = Item.find(1)
  end

  def create
    begin
      token = "tok_16cc31255f4688ecfd20c3ab2a3f"
      Payjp.api_key = "sk_test_833ebfb77824020c76ea83f0"
      Payjp::Charge.create(
        amount: params[:price],
        card: params[:payjp_token],
        currency: 'jpy'
      )
      redirect_to purchase_item_purchases_path
    rescue
      redirect_to action: 'new', flash: {notice: 'メッセージ'}
    end
  end

  def purchase
    item = Item.find(params[:item_id])
    item.update(buyer_id: 2, deal_state: 3)
  end
end
