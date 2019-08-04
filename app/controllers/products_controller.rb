class ProductsController < ApplicationController

	def index
		@products = Product.all
		@artist = Artist.all
	end

	def show
		@product = Product.find(params[:id])
	end

end
