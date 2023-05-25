require 'sidekiq/web'
Rails.application.routes.draw do
  authenticate :admin do
    mount Sidekiq::Web => "/sidekiq"
  end
  devise_for :users
  devise_for :admins

  root 'products#index'

  post 'add_to_cart/:product_id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:product_id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  get 'cart/checkout', to: 'carts#checkout', as: 'checkout'
  resource :cart, only: [:show]

  resources :products, only: [:index, :show]
  resources :orders
  
  namespace :admin do
    resources :products
    resources :orders, only: [:index]
    get 'dashboard', to: 'dashboard#index'
  end

  get '/users/:id/orders', to: 'users#orders', as: 'user_orders'

end
