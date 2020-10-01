require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car) { build(:car) }
  let(:car_missing_model) { build(:car, model: nil) }
  let(:car_missing_manufacturer) { build(:car, manufacturer: nil) }
  let(:car_missing_plate) { build(:car, plate: nil) }
  let(:car_missing_manufacturer_year) { build(:car, manufacturer_year: nil) }
  let(:car_missing_model_year) { build(:car, model_year: nil) }

  it "is valid" do
    expect(car).to be_valid
  end
  
  it "is invalid (missing model)" do
    expect(car_missing_model).to be_invalid
  end
  
  it "is invalid (missing manufacturer)" do
    expect(car_missing_manufacturer).to be_invalid
  end
  
  it "is invalid (missing plate)" do
    expect(car_missing_plate).to be_invalid
  end
  
  it "is invalid (missing manufacturer_year)" do
    expect(car_missing_manufacturer_year).to be_invalid
  end
  
  it "is invalid (missing model_year)" do
    expect(car_missing_model_year).to be_invalid
  end

end
