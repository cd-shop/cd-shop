Rails.application.routes.draw do

  get 'practices/index'
  root 'products#index'
  devise_for :users
  resources :users do
  	resources :orders, only: [:index, :create]
  end
  resources :products

  namespace :admin do
    resources :users
  end
end
