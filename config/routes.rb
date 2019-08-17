Rails.application.routes.draw do

  get 'practices/index'
  root 'products#index'
  devise_for :users
  resources :users
  resources :products
  namespace :admin do
    resources :users
    resources :products
  end
end
