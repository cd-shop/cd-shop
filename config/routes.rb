Rails.application.routes.draw do

  root 'products#index'
  devise_for :users

  resources :users do
    resources :orders, only: [:index, :create]
  end
  resources :cart_products

  resources :products, only:[:index, :show]


  namespace :admin do
    resources :users
    resources :products
    resources :artist, only: [:new, :create]
    resources :genre, only: [:new, :create]
    resources :label, only: [:new, :create]
  end
end
