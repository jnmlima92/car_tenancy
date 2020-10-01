require 'rails_helper'

RSpec.describe Tenancy, type: :model do
  let(:tenancy) { build(:tenancy) }
  let(:car_not_found) { build(:tenancy, car_id: FFaker::Random.rand(10..100)) }
  let(:invalid_cpf_tenancy) { build(:tenancy, tenant_cpf: CPF.generate(true)) }
  let(:missing_car_id) { build(:tenancy, car_id: nil) }
  let(:missing_checkin) { build(:tenancy, checkin: nil) }
  let(:missing_checkout) { build(:tenancy, checkout: nil) }
  
  it "is invalid (invalid cpf)" do
    expect(invalid_cpf_tenancy).to be_invalid
  end
  
  it "is invalid (missing car_id)" do
    expect(missing_car_id).to be_invalid
  end
  
  it "is invalid (missing checkin)" do
    expect(missing_checkin).to be_invalid
  end
  
  it "is invalid (missing checkout)" do
    expect(missing_checkout).to be_invalid
  end
  
  it "is invalid (car not exists)" do
    expect(car_not_found).to be_invalid
  end
  
  it "is valid" do
    expect(tenancy).to be_valid
  end
  
end
