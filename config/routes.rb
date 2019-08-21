Rails.application.routes.draw do

  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :users
    resources :products
    resources :artist
    resources :genre
    resources :label
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  resources :products, only:[:index, :show]
  

end
