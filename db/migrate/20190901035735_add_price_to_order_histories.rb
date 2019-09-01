class AddPriceToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :price, :integer
  end
end
