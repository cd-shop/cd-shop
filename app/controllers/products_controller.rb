class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def products_params
		params.require(:products).permit(:genre_id, :artist_id, :label_id, :productname, :sale_status, :price, :stocknumber)
	end
end
