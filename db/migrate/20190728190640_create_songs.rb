class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :cd_id
      t.string :songname
      t.integer :song_number

      t.timestamps
    end
  end
end
