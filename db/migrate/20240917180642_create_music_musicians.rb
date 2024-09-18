class CreateMusicMusicians < ActiveRecord::Migration[7.1]
  def change
    create_table :music_musicians do |t|
      t.references :music, null: false, foreign_key: true
      t.references :musician, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
