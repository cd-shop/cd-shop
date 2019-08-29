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
#もし住所がないならどこかに飛ばしてあげよう,住所選択画面とか？
			redirect_to admin_products_path
		else
			order.address_number = current_user.addresses.first.address_number
			order.prefecture = current_user.addresses.first.prefecture
			order.municipality = current_user.addresses.first.municipality
			order.building = current_user.addresses.first.building

#URLに値を渡す前に住所の選択をさせて、パラメータに渡せばいいのか
			# redirect_to action: :index, user_id: order.user_id, address_number: current_user.addresses.first.address_number, prefecture: current_user.addresses.first.prefecture, municipality: current_user.addresses.first.municipality, building: current_user.addresses.first.building
			redirect_to user_orders_path(current_user.id)
		end
	end




	def index
		#ログインユーザのカート内商品を全て取得
		@all_products = current_user.cart_products.all
		# @address_number = params[:address_number]
		# @prefecture = params[:prefecture]
		# @municipality = params[:municipality]
		# @building = params[:building]
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

