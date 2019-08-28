class OrderHistoriesController < ApplicationController
    def show
        @order_history = OrderHistory.find(params[:id])
    end

    def create
        order_history = OrderHistory.new
        order_history.user_id = current_user.id
        order_history.order_id = params[:order_id]

        # order_history.productname = current_user.cart_products.product.productname
        money1 = order_history.order.subtotal
        money2 = order_history.order.postage
        order_history.total_amount = money1 + money2
        order_history.save
        redirect_to user_order_history_path(current_user.id, order_history.id)
    end
end

