class RenameImageIgColumnToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_histories, :image_ig, :image_id
  end
end
