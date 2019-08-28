class AddUserIdToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :user_id, :integer
  end
end
