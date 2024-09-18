class Musician < ApplicationRecord
    has_many :music_musicians
    has_many :musics, through: :music_musicians
    has_many :band_musicians
    has_many :bands, through: :band_musicians
  end