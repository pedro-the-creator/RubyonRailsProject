class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.string :name
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
