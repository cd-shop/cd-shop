class ChangeDataProductIdToCds < ActiveRecord::Migration[5.2]
  def change
    change_column :cds, :product_id, :integer
  end
end
