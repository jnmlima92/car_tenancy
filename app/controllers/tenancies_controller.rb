class TenanciesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_tenancy, only: [:show, :edit, :update, :destroy]

  # GET /tenancies
  # GET /tenancies.json
  def index
    @tenancies = Tenancy.all
  end

  # GET /tenancies/1
  # GET /tenancies/1.json
  def show
  end

  # GET /tenancies/new
  def new
    @tenancy = Tenancy.new
  end

  # GET /tenancies/1/edit
  def edit
  end

  # POST /tenancies
  # POST /tenancies.json
  def create
    @tenancy = Tenancy.new(tenancy_params)

    respond_to do |format|
      if @tenancy.save
        format.html { redirect_to @tenancy, notice: 'Tenancy was successfully created.' }
        format.json { render :show, status: :created, location: @tenancy }
      else
        format.html { render :new }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenancies/1
  # PATCH/PUT /tenancies/1.json
  def update
    respond_to do |format|
      if @tenancy.update(tenancy_params)
        format.html { redirect_to @tenancy, notice: 'Tenancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenancy }
      else
        format.html { render :edit }
        format.json { render json: @tenancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenancies/1
  # DELETE /tenancies/1.json
  def destroy
    @tenancy.destroy
    respond_to do |format|
      format.html { redirect_to tenancies_url, notice: 'Tenancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenancy
      @tenancy = Tenancy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tenancy_params
      params.require(:tenancy).permit(:checkin, :checkout, :tenant_cpf, :car_id)
    end
end
