class CreateAlbumMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :album_musics do |t|
      t.references :album, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true
      t.integer :track_number

      t.timestamps
    end
  end
end
