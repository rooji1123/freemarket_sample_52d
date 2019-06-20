Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }
  
  devise_scope :user do
    get 'registration' => 'users/registrations#info'
    post 'registration/phone_number' =>'users/registrations#phone_number'
    post 'registration/address' => 'users/registrations#address'
    post 'registration/payment' => 'users/registrations#user_card'
    post 'registration.user' => 'users/registrations#create'
  end
  root 'items#index'
  resources :users, only:[:show, :edit]
  resources :items
  resources :categories, only:[:index, :show]
  resources :brands, only:[:index, :show]
  scope module: 'users' do
    resources :user_cards, only:[:edit, :update]
    resources :user_addresses, only:[:edit, :update]
    resources :user_informations, only:[:edit, :update]
  end
end
