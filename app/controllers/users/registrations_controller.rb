class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  def info
  end

  def phone_number
    session.merge!(new_user_params)
  end

  def authcode
  end

  def address
    session.merge!(new_user_information_params)
  end

  def user_card
    @user = User.new
    @user.build_user_card
    session.merge!(new_user_address_params)
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        super
      end
    end
  end

  private
  def new_user_params
    params[:birthday] = params[:birth_year] + params[:birth_month] + params[:birth_day]
    params.permit(:nickname, :email, :password, :password_confirmation, :birthday, :last_name, :first_name, :last_name_kana, :first_name_kana, )
  end

  def new_user_information_params
    params.permit(:check_phone_number)
  end

  def new_user_address_params
    params.permit( :last_name_address, :first_name_address, :last_name_kana_address, :first_name_kana_address, :postal_code, :coutry_id, :city, :address, :building_name, :phone_number)
  end

  def configure_sign_up_params
    params[:user].merge!(nickname: session[:nickname],email: session[:email], password: session[:password],password_confirmation: session[:password_confirmation], build_user_information:{last_name: session[:last_name], first_name: session[:first_name], last_name_kana: session[:last_name_kana], first_name_kana: session[:first_name_kana], birthday: session[:birthday], check_phone_number: session[:check_phone_number]}, build_user_address:{last_name_address: session[:last_name_address], first_name_address: session[:first_name_address], last_name_kana_address: session[:last_name_kana_address], first_name_kana_address: session[:first_name_kana_address], postal_code: session[:postal_code], country_id: session[:country_id], city: session[:city], address: session[:address], building_name: session[:building_name], phone_number: session[:phone_number]})
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, user_information_attributes: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :check_phone_number], user_address_attributes: [:last_name_address, :first_name_address, :last_name_kana_address, :first_name_kana_address, :postal_code, :country_id, :city, :address, :building_name, :phone_number], user_card_attributes: [:card_number, :expiration_month, :expiration_year, :security_code]])
  end

end
