Rails.application.routes.draw do

  root 'products#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  namespace :admin do
    resources :users
    resources :products
    resources :artist
    resources :genre
    resources :label
  end

  resources :products, only:[:index, :show]
  

end
