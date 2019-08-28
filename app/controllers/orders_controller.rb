class OrdersController < ApplicationController
#注文画面で商品情報(曲名、アーティスト名、ジャケ画)の表示の仕方がわからない
	def index
		@all_products = current_user.cart_products.all
		@order = Order.find_by(params[:user_id])
		if current_user.addresses.blank?

		else
			@order.address_number = current_user.addresses.first.address_number
			@order.prefecture = current_user.addresses.first.prefecture
			@order.municipality = current_user.addresses.first.municipality
			@order.building = current_user.addresses.first.building
		end

		@order.postage = 500

		@order.subtotal = 0

		@all_products.each do |cp|
			total = cp.product.price * cp.purchase_number
			@order.subtotal += total
		end

	end

	def create
		order = Order.new
		order.user_id = current_user.id
		@all_products = current_user.cart_products.all


		# order.address_number = current_user.addresses.first.address_number
		# order.prefecture = current_user.addresses.first.prefecture
		# order.municipality = current_user.addresses.first.municipality
		# order.building = current_user.addresses.first.building
		order.postage = 500
		order.subtotal = 0
		@all_products.each do |cp|
			total = cp.product.price * cp.purchase_number
			order.subtotal += total
		end
		# order.product_id = current_user.cart_product_id.product_id
		order.save
<<<<<<< HEAD
		
=======

>>>>>>> 8945e8503b37e51651783e749c02d2e8138eeafc
		redirect_to user_orders_path(current_user.id)
	end

	private

end

