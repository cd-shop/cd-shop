class OrderHistoriesController < ApplicationController
    def show

    end

    def create
        order_history = OrderHistory.new
        order_history.order_id = Order.find(params[:order_id])
        order_history.save!
        redirect_to user_order_history_path(current_user.id, order_history.id)
    end
end
