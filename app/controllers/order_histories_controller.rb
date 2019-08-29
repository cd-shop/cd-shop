class OrderHistoriesController < ApplicationController
    def index
        @order_histories = current_user.order_history.all
    end

    def create
		@all_products = current_user.cart_products.all
#ここで注文の保存
        order= Order.new
		order.user_id = current_user.id
        order.address_number = current_user.addresses.first.address_number
        order.prefecture = current_user.addresses.first.prefecture
        order.municipality = current_user.addresses.first.municipality
        order.building = current_user.addresses.first.building
        order.postage = 500
        subtotal = 0
            @all_products.each do |cp|
                total = cp.product.price * cp.purchase_number
                subtotal += total
            end
        order.subtotal = subtotal
            #URLに値を渡す前に住所の選択をさせて、パラメータに渡せばいいのか
            # redirect_to action: :show, user_id: order.user_id, address_number: current_user.addresses.first.address_number, prefecture: current_user.addresses.first.prefecture, municipality: current_user.addresses.first.municipality, building: current_user.addresses.first.building
        order.save

#ここで各購入の保存、order idがおなじやつとればいいのか
        @all_products.each do |cart|
            order_history = OrderHistory.new(order_history_params)
            product = cart.product
            order_history.product_id = product.id
            order_history.image_id = product.image_id
            order_history.productname = product.productname
            order_history.artistname = product.artist.artistname
            order_history.labelname = product.label.labelname
            order_history.genrename = product.genre.genrename
            order_history.pay_select = params[:pay_select]
            order_history.user_id = current_user.id
            order_history.order_id = order.id
            order_history.total_amount = order.subtotal + order.postage
            order_history.shipment_status = 0
            order_history.quantity = cart.purchase_number
            order_history.save
        end
        redirect_to user_order_path(current_user.id, order.id)
    end



    private
    def order_history_params
        #チェックボックスしていないとエラーなる
        params.require(:order_history).permit(order_histories_attributes: [:pay_select])
    end
end

