class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_search

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "root" && password == "1111"
    end
  end

  def set_search
    @q = Item.ransack(params[:q])
  end
end
