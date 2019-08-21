class ChangeDataGenreIdToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :genre_id, :integer
  end
end
