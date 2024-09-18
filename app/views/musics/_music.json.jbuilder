json.extract! music, :id, :name, :duration_seconds, :created_at, :updated_at
json.url music_url(music, format: :json)
