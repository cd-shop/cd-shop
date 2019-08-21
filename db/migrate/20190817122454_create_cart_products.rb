class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :purchase_number

      t.timestamps
    end
  end
end
