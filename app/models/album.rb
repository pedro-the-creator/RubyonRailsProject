class Album < ApplicationRecord
  belongs_to :band
  has_many :album_musics
  has_many :musics, through: :album_musics
  validates :name, presence: true
  validates :release_year, presence: true, numericality: { 
    greater_than_or_equal_to: 1900, 
    less_than_or_equal_to: -> { Date.current.year }
  }
end