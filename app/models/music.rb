class Music < ApplicationRecord
    has_many :music_musicians
    has_many :musicians, through: :music_musicians
    has_many :album_musics
    has_many :albums, through: :album_musics
    
  end