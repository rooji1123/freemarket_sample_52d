class Users::UserCardsController < ApplicationController
  def edit
    Payjp.api_key = 'sk_test_833ebfb77824020c76ea83f0'
    card_data = Payjp::Customer.retrieve(current_user.user_card.customer_id)
    @card = {
      last4: card_data[:cards][:data][0][:last4],
      exp_month: card_data[:cards][:data][0][:exp_month],
      exp_year: card_data[:cards][:data][0][:exp_year],
      brand: card_data[:cards][:data][0][:brand]
    }
  end
end
