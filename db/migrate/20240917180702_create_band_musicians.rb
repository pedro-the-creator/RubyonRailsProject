class CreateBandMusicians < ActiveRecord::Migration[7.1]
  def change
    create_table :band_musicians do |t|
      t.references :band, null: false, foreign_key: true
      t.references :musician, null: false, foreign_key: true
      t.integer :join_year

      t.timestamps
    end
  end
end
