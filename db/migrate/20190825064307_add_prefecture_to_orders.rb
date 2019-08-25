class AddPrefectureToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :prefecture, :string
  end
end
