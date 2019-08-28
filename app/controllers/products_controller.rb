class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

	def index
		@songs = Song.all.order(created_at: :desc).page(params[:page]).per(10)
		@artists= Artist.all.order(created_at: :desc).page(params[:page]).per(10)
		@products = Product.search(params[:search]).page(params[:page]).per(10)
	end

	def show
		@product = Product.find(params[:id])
		if user_signed_in?
			@cart = current_user.cart_products.new
		end
	end
	class ProductSearchForm
		include ActiveModel::Model

		attr_accessor  :productname

		def search
			rel = Product
			rel = rel.where( productname: productname ) if productname.present?
		
			rel
		end
	end

end