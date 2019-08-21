class ChangeDataCdIdToSongs < ActiveRecord::Migration[5.2]
  def change
    change_column :songs, :cd_id, :integer
  end
end
