class OrdersController < ApplicationController

	def create
		order = Order.new
		order.user_id = current_user.id
		@all_products = current_user.cart_products.all
		if current_user.addresses.empty?
		else
			order.address_number = current_user.addresses.first.address_number
			order.prefecture = current_user.addresses.first.prefecture
			order.municipality = current_user.addresses.first.municipality
			order.building = current_user.addresses.first.building
		end

		order.postage = 500
		order.subtotal = 0
		@all_products.each do |cp|
			total = cp.product.price * cp.purchase_number
			order.subtotal += total
		end
		# order.product_id = current_user.cart_product_id.product_id
		order.save
		redirect_to user_order_path(current_user.id, order.id)
	end



	def show
		#ログインユーザのカート内商品を全て取得
		@all_products = current_user.cart_products.all
		@order = Order.find(params[:id])
	end
end

