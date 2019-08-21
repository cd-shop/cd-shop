class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :subtotal
      t.integer :postage
      t.integer :shipment_status
      t.string :address_number
      t.string :municipality
      t.string :building

      t.timestamps
    end
  end
end
