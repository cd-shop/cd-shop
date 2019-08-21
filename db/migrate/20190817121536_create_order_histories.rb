class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :productname
      t.string :artistname
      t.string :labelname
      t.string :genrename
      t.text :image_ig
      t.integer :total_amount
      t.integer :quantity

      t.timestamps
    end
  end
end
