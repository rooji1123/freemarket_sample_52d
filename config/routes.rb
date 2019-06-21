Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only:[:show, :edit]
  resources :items do
    collection do
      get 'search'
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    collection do
      get :category_search
    end
    resources :purchases, only:[:new, :create, :update, :index] do
      collection do
        get 'purchase'
      end
    end
  end
  resources :categories, only:[:index, :show]
  resources :brands, only:[:index, :show]
  scope module: 'users' do
    resources :user_cards, only:[:edit, :update]
    resources :user_identifications, only:[:edit, :update]
  end
end