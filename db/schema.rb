# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_17_180721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_musics", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "music_id", null: false
    t.integer "track_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_musics_on_album_id"
    t.index ["music_id"], name: "index_album_musics_on_music_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "release_year"
    t.bigint "band_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_albums_on_band_id"
  end

  create_table "band_musicians", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.bigint "musician_id", null: false
    t.integer "join_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_musicians_on_band_id"
    t.index ["musician_id"], name: "index_band_musicians_on_musician_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.integer "formation_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "music_musicians", force: :cascade do |t|
    t.bigint "music_id", null: false
    t.bigint "musician_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_music_musicians_on_music_id"
    t.index ["musician_id"], name: "index_music_musicians_on_musician_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.string "name"
    t.integer "duration_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "album_musics", "albums"
  add_foreign_key "album_musics", "musics"
  add_foreign_key "albums", "bands"
  add_foreign_key "band_musicians", "bands"
  add_foreign_key "band_musicians", "musicians"
  add_foreign_key "music_musicians", "musicians"
  add_foreign_key "music_musicians", "musics"
end
