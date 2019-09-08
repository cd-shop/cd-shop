class RemoveSongNumberFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_number, :integer
  end
end
