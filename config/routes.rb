Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only:[:show, :edit]
  resources :items
  resources :categories, only:[:index, :show]
  resources :brands, only:[:index, :show]
  scope module: 'users' do
    resources :user_cards, only:[:edit, :update]
    resources :user_identifications, only:[:edit, :update]
  end
end
