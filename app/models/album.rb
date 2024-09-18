class Album < ApplicationRecord
  belongs_to :band
  has_many :album_musics
  has_many :musics, through: :album_musics
end