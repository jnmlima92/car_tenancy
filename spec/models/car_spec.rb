require 'rails_helper'

RSpec.describe Car, type: :model do
  it "is a valid Car" do
    expect(Car.new(model: 'Model test', manufacturer: 'Manufacturer test', plate: 'Plate test', model_year: 1992, manufacturer_year: 2000)).to be_valid
  end
  
  it "is a invalid Car (without model)" do
    expect(Car.new(manufacturer: 'Manufacturer test', plate: 'Plate test', model_year: 1992, manufacturer_year: 2000)).to be_invalid
  end
  
  it "is a invalid Car (without manufacturer)" do
    expect(Car.new(model: 'Model test', plate: 'Plate test', model_year: 1992, manufacturer_year: 2000)).to be_invalid
  end
  
  it "is a invalid Car (without plate)" do
    expect(Car.new(model: 'Model test', manufacturer: 'Manufacturer test', model_year: 1992, manufacturer_year: 2000)).to be_invalid
  end
  
  it "is a invalid Car (without manufacturer_year)" do
    expect(Car.new(model: 'Model test', plate: 'Plate test', manufacturer: 'Manufacturer test', model_year: 1992)).to be_invalid
  end
  
  it "is a invalid Car (without model_year)" do
    expect(Car.new(model: 'Model test', plate: 'Plate test', manufacturer: 'Manufacturer test', manufacturer_year: 2000)).to be_invalid
  end

end
