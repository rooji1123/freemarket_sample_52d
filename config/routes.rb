Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

  root 'items#index'
  resources :users, only:[:show, :edit] do
    member do
      get 'log_out'
    end
  end
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    collection do
      get :category_search
      get :brand_search
      get :search
    end
    resources :purchases, only:[:new, :create, :update, :index] do
      collection do
        get 'purchase'
      end
    end
  end
  resources :categories, only:[:index, :show]
  resources :brands, only:[:index, :show]
  resources :users, onry: [:show] do
    scope module: 'users' do
      resources :user_cards, only:[:edit, :update]
      resources :user_identifications, only:[:edit, :update]
      resources :exhibitions, only:[:index, :show, :edit, :update]
    end
  end
  scope module: 'users' do
    resources :user_cards, only:[:edit, :update]
    resources :user_addresses, only:[:edit, :update]
    resources :user_informations, only:[:edit, :update]
  end
end