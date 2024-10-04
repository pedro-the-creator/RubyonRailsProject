puts "Creating bands..."
bands = []
10.times do
  bands << Band.create!(
    name: Faker::Music.band,
    formation_year: Faker::Number.between(from: 1960, to: 2023)
  )
end

puts "Creating musicians..."
musicians = []
20.times do
  musicians << Musician.create!(
    name: Faker::Name.name, # Usando Faker::Name para músicos
    age: Faker::Number.between(from: 20, to: 70)
  )
end

puts "Creating albums..."
albums = []
30.times do
  albums << Album.create!(
    name: Faker::Music.album,
    release_year: Faker::Number.between(from: 1960, to: 2023),
    band: bands.sample
  )
end

puts "Creating musics..."
musics = []
50.times do
  musics << Music.create!(
    name: Faker::Music::RockBand.song,
    duration_seconds: Faker::Number.between(from: 120, to: 600)
  )
end

puts "Creating album_musics..."
50.times do
  AlbumMusic.create!(
    album: albums.sample,
    music: musics.sample,
    track_number: Faker::Number.between(from: 1, to: 12)
  )
end

puts "Creating band_musicians..."
40.times do
  BandMusician.create!(
    band: bands.sample,
    musician: musicians.sample,
    join_year: Faker::Number.between(from: 1960, to: 2023)
  )
end

puts "Creating music_musicians..."
50.times do
  MusicMusician.create!(
    music: musics.sample,
    musician: musicians.sample,
    role: ['Guitar', 'Vocals', 'Drums', 'Bass', 'Keyboard'].sample
  )
end

puts "Seeding done!"
