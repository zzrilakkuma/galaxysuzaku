Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root 'products#index'

  post 'add_to_cart/:product_id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  resource :cart, only: [:show]

  resources :products
  resources :orders
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

end
