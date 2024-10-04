require "rails_helper"
require "factory_bot"

RSpec.describe Band, type: :model do
  it "is valid with valid attributes" do
    band = FactoryBot.build(:band)
    expect(band).to be_valid
  end

  it "is not valid without a name" do
    band = FactoryBot.build(:band, name: nil)
    expect(band).to_not be_valid
  end

  it "is not valid with a formation year earlier than 1900" do
    band = FactoryBot.build(:band, formation_year: 1800)
    expect(band).to_not be_valid
  end
end
