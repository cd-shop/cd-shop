class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.string :song_id
      t.string :product_id
      t.string :cdname

      t.timestamps
    end
  end
end
