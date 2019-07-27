class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :genre_id
      t.string :artist_id
      t.string :label_id
      t.string :productname
      t.integer :price
      t.string :update_date
      t.integer :stock_number
      t.string :sale_status

      t.timestamps
    end
  end
end
