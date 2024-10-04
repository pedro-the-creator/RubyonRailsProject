require 'faker'

FactoryBot.define do
  factory :band do
    name { Faker::Music.band }
    formation_year { Faker::Number.between(from: 1950, to: 2024) }
  end
end
