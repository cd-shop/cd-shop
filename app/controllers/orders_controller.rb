class OrdersController < ApplicationController

#注文画面で商品情報(曲名、アーティスト名、ジャケ画)の表示の仕方がわからない
	def index
		@all_products = current_user.cart_products.all
		@order = Order.find_by(params[:user_id])
#住所の定義
		# これで取れないのはアソシエーションがされてないから？
		# @order.address_number = current_user.addresses.address_number
		@order.prefecture = "岡山県"
		@order.municipality = "岡山市"
		@order.building = "3-3-1"
	end

	def create
		order = Order.new
		order.user_id = current_user.id
		order.shipment_status = 4
		order.postage = 500
		order.subtotal = 1500
		@all_products = current_user.cart_products.all
		# order.product_id = current_user.cart_product.product_id
		order.save
		redirect_to orders_index_path
	end

	private

end
