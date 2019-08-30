class CartProductsController < ApplicationController

    def index
        @cart_products = current_user.cart_products.all
    end

    def create
        cart_product = current_user.cart_products.new(cart_product_params)
        cart_product.user_id = current_user.id
        cart_product.product_id = params[:product_id]
        cart_product.save
        redirect_to cart_products_path
    end

    def destroy
        cart_product = CartProduct.find_by(product_id: params[:product_id])
        binding.pry
        cart_product.destroy
        redirect_to cart_products_path
    end

    private
    def cart_product_params
        params.require(:cart_product).permit(:purchase_number)
    end
end
