class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :prefecture
      t.string :municipality
      t.string :address_number

      t.timestamps
    end
  end
end
