class ChangeDataArtistIdToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :artist_id, :integer
  end
end
