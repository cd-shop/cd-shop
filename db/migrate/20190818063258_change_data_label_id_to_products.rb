class ChangeDataLabelIdToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :label_id, :integer
  end
end
