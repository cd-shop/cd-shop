class CartProductsController < ApplicationController

  before_action :stock_set, only: [:create]

    def index
        @cart_products = current_user.cart_products.all
        @cart_product = current_user.cart_products.new
        @address = current_user.addresses.all
        @user = current_user.id
    end

    def create
        @cart_product = current_user.cart_products.new(cart_product_params)
        @cart_product.user_id = current_user.id
        @cart_product.product_id = params[:product_id]
        @cart_product.save
        redirect_to cart_products_path
    end

    def destroy
        cart_product = CartProduct.find_by(product_id: params[:product_id])
        cart_product.destroy
        redirect_to cart_products_path
    end

    private
    def cart_product_params
        params.require(:cart_product).permit(:purchase_number)
    end

    def stock_set
       @product = Product.find(params[:product_id])
       @stock_number = @product.stock_number
       if @stock_number == 0
           redirect_to product_path(@product)
       end
   end
end
