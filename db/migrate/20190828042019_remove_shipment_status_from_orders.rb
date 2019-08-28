class RemoveShipmentStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipment_status, :integer
  end
end
