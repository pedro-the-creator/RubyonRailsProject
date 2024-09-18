json.extract! album, :id, :name, :release_year, :band_id, :created_at, :updated_at
json.url album_url(album, format: :json)
