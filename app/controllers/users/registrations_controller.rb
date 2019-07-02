class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  def index
  end
  
  def new
    @user = User.new
    @user.build_user_card
    @user.build_user_information
    @user.build_user_address
  end

  def create
    if verify_recaptcha
      super
    else
      redirect_to new_user_registration_path
    end
  end

  private
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :provider, :uid,
                                        user_information_attributes: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :check_phone_number],
                                        user_address_attributes: [:last_name_address, :first_name_address, :last_name_kana_address, :first_name_kana_address, :postal_code, :country_id, :city, :address, :building_name, :phone_number],
                                        user_card_attributes: [:card_number, :expiration_month, :expiration_year, :security_code]])
  end

end
