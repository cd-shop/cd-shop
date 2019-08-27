class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

	def index
		@products = Product.all.order(created_at: :desc).page(params[:page]).per(10)
		@songs = Song.all.order(created_at: :desc).page(params[:page]).per(10)
		@artists= Artist.all.order(created_at: :desc).page(params[:page]).per(10)
	end

	def show
		@product = Product.find(params[:id])
		if user_signed_in?
			@cart = current_user.cart_products.new
		end
	end

end