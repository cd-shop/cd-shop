class OrdersController < ApplicationController

#注文画面で商品情報(曲名、アーティスト名、ジャケ画)の表示の仕方がわからない
	def index
		@cart_produtcs = current_user.cart_products.all
		@order = Order.new
	end

	def create
		@order = Order.new
		@order = Order.save(order_params)
		redirect_to products_path
	end

	private

	def order_params
		params.require(:order).permit(:subtotla, :postage, :shipment_status, :address_number, :municipality, :building)
	end

end
