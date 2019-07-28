class ProductsController < ApplicationController

	def index
		@products = Product.all
		@artist = Artist.all
	end

end
