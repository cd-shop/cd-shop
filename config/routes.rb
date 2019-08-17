Rails.application.routes.draw do

  get 'practices/index'
  root 'products#index'
  devise_for :users
  resources :users
  resources :products

  namespace :admin do
    resources :users
  end
 
  namespace :admin do
    resources :products
  end

  namespace :admin do
    resources :order_histries
  end

end
