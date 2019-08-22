class CartProductsController < ApplicationController

    def index
    end

    def create
        @product = Product.find(params[:product_id])
        cart_product = current_user.cart_products.new(product_id: @product.id)
        cart_product.save
        redirect_to cart_products_path
    end

    def destroy
    end


end
