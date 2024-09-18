class MusicMusician < ApplicationRecord
  belongs_to :music
  belongs_to :musician
end