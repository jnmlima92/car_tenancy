require 'rails_helper'

RSpec.describe "Tenancies", type: :request do
  describe "GET /tenancies" do
    it "returning tenancy list" do
      get tenancies_path
      expect(response).to have_http_status(200)
    end

    it "returning datas from all tenancies" do
      tenancies = create_list(:tenancy, 5)
      
      get tenancies_path
      expect(response.body).to include("Tenancies")
      
      tenancies.each do |tenancy|
        expect(response.body).to include(tenancy.car.model)
        expect(response.body).to include(tenancy.tenant_cpf)
      end
    end
  end

  describe "GET /tenancy/:id" do
    it "returning tenancy by id" do
      tenancy = create(:tenancy)

      get tenancy_path tenancy
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /tenancy/:id" do
    context "when has valid params" do
      it "create a tenancy with right attributes" do
        car = create :car
        tenancy_attr = FactoryBot.attributes_for :tenancy
        tenancy_attr[:car_id] = car.id

        post tenancies_path, params: { tenancy: tenancy_attr }
        expect(Tenancy.last).to have_attributes(tenancy_attr)
      end
    end

    context "when has invalid params" do
      it "does not create the tenancy" do
        # car_id not exists
        tenancy_attr = FactoryBot.attributes_for :tenancy

        expect { post tenancies_path, params: { tenancy: tenancy_attr } }.to_not change(Tenancy, :count)
      end
    end
  end
end
