class OrdersController < ApplicationController
#注文画面で商品情報(曲名、アーティスト名、ジャケ画)の表示の仕方がわからない
	def index
		@all_products = current_user.cart_products.all
		@order = Order.find_by(params[:user_id])
		# これで取れないのはアソシエーションがされてないから？
		@order.address_number = current_user.addresses.first.address_number
		@order.prefecture = current_user.addresses.first.prefecture
		@order.municipality = current_user.addresses.first.municipality
		@order.building = current_user.addresses.first.building
		@order.postage = 500
		@order.subtotal = 30000000000
	end

	def create
		order = Order.new
		order.user_id = current_user.id
		@all_products = current_user.cart_products.all
		# order.product_id = current_user.cart_product.product_id
		order.save
		redirect_to orders_index_path
	end

	private

end
