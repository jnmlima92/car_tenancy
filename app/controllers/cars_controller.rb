# frozen_string_literal: true
require 'net/http' #move to lib

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    manufacturers
  end

  # GET /cars/1/edit
  def edit
    manufacturers
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        manufacturers
        
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        manufacturers
        
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def manufacturers
    url = URI.parse('http://fipeapi.appspot.com/api/1/carros/marcas.json')
    req = Net::HTTP::Get.new(url.to_s)

    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    
    if res.kind_of? Net::HTTPSuccess
      @manufacturers = JSON.parse(res.body).map { |manufacturer| { 'name' => manufacturer['fipe_name'], 'id' => manufacturer['id'] } }
      
      if @car.id?
        car_manufacturer = @manufacturers.find { |ma| ma['name'] == @car.manufacturer } 
        @selected_manufaturer = car_manufacturer['id']
      end
    else
      render_404
    end
  end

  def models
    if params[:manufacturer_id].present?
      url = URI.parse("http://fipeapi.appspot.com/api/1/carros/veiculos/#{params[:manufacturer_id]}.json")
      req = Net::HTTP::Get.new(url.to_s)
  
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      
      if res.kind_of? Net::HTTPSuccess
        @models = JSON.parse(res.body)
      else
        render_404
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:model, :manufacturer, :plate, :model_year, :manufacturer_year)
  end
end
