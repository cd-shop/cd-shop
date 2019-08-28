class AddShipmentStatusToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :shipment_status, :integer
  end
end
