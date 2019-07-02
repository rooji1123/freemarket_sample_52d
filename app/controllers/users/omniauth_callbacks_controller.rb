# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end
  private

  # def callback_for(provider)
  #   session[:provider] = request.env["omniauth.auth"].provider
  #   session[:uid] = request.env["omniauth.auth"].uid
  #   session[:nickname] = request.env["omniauth.auth"].info.name
  #   session[:email] = request.env["omniauth.auth"].info.email
  #   session[:password] = request.env["omniauth.auth"].credentials.token[0..5]
  #   if session[:provider] && session[:uid] && session[:nickname] && session[:email] && session[:password]
  #     redirect_to new_user_registration_path
  #   else
  #     session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to users_path
  #   end
  # end

  def callback_for(provider)

    @user = User.find_omniauth(request.env["omniauth.auth"])

    if @user
      sign_in_and_redirect @user #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.provider_data"] = request.env["omniauth.auth"]
      @user = User.new()
      @user.build_user_card
      @user.build_user_information
      @user.build_user_address
      render 'devise/registrations/new'
    end

    def failure
      redirect_to root_path
    end
  end
  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end