class OrdersController < ApplicationController

	def index
		@all_products = current_user.cart_products.all

		@order = Order.new
		# @order = Order.find_by(params[:user_id])


		if current_user.addresses.blank?
		else
		end
#総計で送料を５００たせばいいだけ
		@order.postage = 500
		@order.subtotal = 0
		@all_products.each do |cp|
			total = cp.product.price * cp.purchase_number
			@order.subtotal += total
		end
	end

	def create
		@all_products = current_user.cart_products.all
		order = Order.new
		order.user_id = current_user.id
		if current_user.addresses.empty?
			flash[:address] = "住所を追加してください"
			redirect_to edit_user_path(current_user.id)
		else
			order.address_id = params[:address_id]

			redirect_to user_orders_path(current_user.id)
		end
	end

	def show
		@order = Order.find(params[:id])
		@order_histories = OrderHistory.where(order_id: params[:id])

		@address = Address.find(@order.address_id)

	end

	private
	def shipment_params
		params.require(:order_history).permit(order_hisrories_attributes: [:shipment_status])
    end

end

