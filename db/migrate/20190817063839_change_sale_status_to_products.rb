class ChangeSaleStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :sale_status, :integer
  end
end
