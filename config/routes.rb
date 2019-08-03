Rails.application.routes.draw do
  get 'practices/index'
  root 'products#index'
  devise_for :users

  resources :products
end
