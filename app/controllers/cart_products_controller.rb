class CartProductsController < ApplicationController

    def index
        @cart_products = CartProduct.all
    end

    def create
        @product = params[:format].to_i
        cart_product = current_user.cart_products.new(product_id: @product)
        cart_product.product_id = @product.to_i
        cart_product.save
        redirect_to cart_products_path
    end

    def destroy
        cart_product = CartProduct.find(params[:id])
        cart_product.destroy
        redirect_to cart_products_path
    end

    private
    def cart_product_params
        params.require(:cart_product).permit(:user_id, :product_id, :purcase_number)
    end
end
