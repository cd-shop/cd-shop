class CartProductsController < ApplicationController

    def index
        @cart_products = current_user.cart_products.all
    end

    def create

        @parameter = params[:format].to_i
        cart_product = current_user.cart_products.new(product_id: @parameter)
        cart_product.user_id = current_user.id
        cart_product.save
        redirect_to cart_products_path

    end

    def destroy
        cart_product = CartProduct.find(params[:id])
        cart_product.destroy
        redirect_to cart_products_path
    end

end
