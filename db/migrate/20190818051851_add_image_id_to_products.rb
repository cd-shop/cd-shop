class AddImageIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image_id, :text
  end
end
