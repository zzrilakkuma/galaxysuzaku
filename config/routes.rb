Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root 'products#index'
  resources :products
  resources :orders

  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

end
