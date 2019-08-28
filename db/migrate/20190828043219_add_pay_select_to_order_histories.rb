class AddPaySelectToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :pay_select, :integer, default: 0
  end
end
