class ProductsController < ApplicationController

	def index
		@products = Product.all.order(created_at: :desc).page(params[:page]).per(10)
		@songs = Song.all.order(created_at: :desc).page(params[:page]).per(10)
		@artists= Artist.all.order(created_at: :desc).page(params[:page]).per(10)
	end

	def show
		@product = Product.find(params[:id])
	end

	def update
	end
end