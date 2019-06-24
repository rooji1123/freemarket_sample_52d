Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

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
