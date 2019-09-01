Rails.application.routes.draw do

  root 'products#index'
  devise_for :users

  #userの注文、履歴が分かりやすいようにネスト
  resources :users do
    resources :addresses, only: [:edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_histories, only: [:index, :create]
  end



  #productの情報を取るためにcreateだけネスト
  resources :products, only:[:index, :show] do
    resources :cart_products, only: [:create, :destroy]
  end

  #cartproductの情報を取るためにcreateだけネスト
  resources :cart_products, only: [:index, :show, :destroy, :update] do
    resources :orders, only: [:create, :destroy]
  end

  resources :orders, only: [:show]


  namespace :admin do
    get "top" => "products#top"
    get "adasdfasdfasdfasdfksadfihsdfioehiepfahdvklasndfasknefpiaseipasefabsdklva" => "users#another", as:"another"
    resources :users
    resources :products
    resources :artist, only: [:new, :create]
    resources :genre, only: [:new, :create]
    resources :label, only: [:new, :create]
  end
end
