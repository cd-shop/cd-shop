Rails.application.routes.draw do
  get 'practices/index'
  devise_for :users

  resources :products
end
