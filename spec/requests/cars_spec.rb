require 'rails_helper'

RSpec.describe "Cars", type: :request do
  include Devise::Test::IntegrationHelpers
  
  describe "GET /cars" do
    context "with a logged user" do
      before(:each) do 
        sign_in create :user
      end
      
      it "works! (now write some real specs)" do
        get cars_path
        expect(response).to have_http_status(200)
      end
  
      it "returning datas from all cars" do
        cars = create_list(:car, 5)
        
        get cars_path
        expect(response.body).to include("Cars")
        
        cars.each do |car|
          expect(response.body).to include(car.model)
          expect(response.body).to include(car.manufacturer)
          expect(response.body).to include(car.manufacturer_year.to_s)
          expect(response.body).to include(car.model_year.to_s)
          expect(response.body).to include(car.plate)
        end
      end
    end
  end

  describe "GET /car/:id" do
    context "with a logged user" do
      before(:each) do 
        sign_in create :user
      end

      it "returning car by id" do
        car = create(:car)
  
        get car_path car
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /car/:id with a logged user" do
    context "when has valid params" do
      before(:each) do 
        sign_in create :user
      end
      
      it "create a car with right attributes" do
        car_attr = FactoryBot.attributes_for :car

        post cars_path, params: { car: car_attr }
        expect(Car.last).to have_attributes(car_attr)
      end
    end

    context "when has invalid params" do
      it "does not create the tenancy" do
        # model is nil
        car_attr = FactoryBot.attributes_for :car
        car_attr[:model] = nil

        expect { post cars_path, params: { car: car_attr } }.to_not change(Car, :count)
      end
    end
  end

  describe "POST /car/:id without a logged user" do
    it "redirect to login page" do
      car_attr = FactoryBot.attributes_for :car

      post cars_path, params: { car: car_attr }
      expect(response).to redirect_to new_user_session_path
    end
  end
end
