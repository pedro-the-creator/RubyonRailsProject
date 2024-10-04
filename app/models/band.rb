class Band < ApplicationRecord
    has_many :albums
    has_many :band_musicians
    has_many :musicians, through: :band_musicians

    validates :name, presence: true
    validates :formation_year, presence: true, numericality: { 
      greater_than_or_equal_to: 1900,
      less_than_or_equal_to: -> { Date.current.year }
    }
  end