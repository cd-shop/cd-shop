class OrdersController < ApplicationController
	def new
	end
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

	# def create
	# 	order = Order.new
	# 	order.user_id = current_user.id
	# 	@all_products = current_user.cart_products.all

	# 	if current_user.addresses.empty?
	# 	else
	# 		order.address_number = current_user.addresses.first.address_number
	# 		order.prefecture = current_user.addresses.first.prefecture
	# 		order.municipality = current_user.addresses.first.municipality
	# 		order.building = current_user.addresses.first.building
	# 	end

	# 	order.postage = 500
	# 	order.subtotal = 0
	# 	@all_products.each do |cp|
	# 		total = cp.product.price * cp.purchase_number
	# 		order.subtotal += total
	# 	end
	# 	redirect_to user_orders_path(current_user.id)
	# end

	def create
		order = Order.new
		order.user_id = current_user.id
		@all_products = current_user.cart_products.all

		if current_user.addresses.empty?
			flash[:address] = "住所を追加してください"
			redirect_to edit_user_path(current_user.id)
		else
			order.address_id = params[:address_id]
			order.prefecture = current_user.addresses.first.prefecture
			order.municipality = current_user.addresses.first.municipality
			order.building = current_user.addresses.first.building
			
			binding.pry
			
			redirect_to user_orders_path(current_user.id)
		end
	end




	def index
		@all_products = current_user.cart_products.all
		@postage = 500
		@subtotal = 0
		@all_products.each do |cp|
			total = cp.product.price * cp.purchase_number
			@subtotal += total
		end
	end

	def show
		@order = Order.find(params[:id])
		@order_histories = OrderHistory.where(order_id: params[:id])
	end
end

