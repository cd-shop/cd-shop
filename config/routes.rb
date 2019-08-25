Rails.application.routes.draw do

  get 'orders/index'
  get 'orders/create'
  root 'products#index'
  devise_for :users

  resources :users do
    resources :orders, only: [:index]
  end


  resources :cart_products, only: [:index, :show] do
    resources :orders, only: [:create, :destroy]
  end

  resources :products, only:[:index, :show] do
    resources :cart_products, only: [:create, :destroy]
  end


  namespace :admin do
    get "top" => "products#top"
    resources :users
    resources :products
    resources :artist, only: [:new, :create]
    resources :genre, only: [:new, :create]
    resources :label, only: [:new, :create]
  end
end
