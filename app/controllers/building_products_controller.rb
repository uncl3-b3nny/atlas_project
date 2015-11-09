class BuildingProductsController < ApplicationController
  before_action :set_building_product, only: [:show, :edit, :update, :destroy]

  # GET /building_products
  # GET /building_products.json
  def index
    @building_products = BuildingProduct.all
  end

  # GET /building_products/1
  # GET /building_products/1.json
  def show
  end

  # GET /building_products/new
  def new
    @building_product = BuildingProduct.new
  end

  # GET /building_products/1/edit
  def edit
  end

  # POST /building_products
  # POST /building_products.json
  def create
    @building_product = BuildingProduct.new(building_product_params)

    respond_to do |format|
      if @building_product.save
        format.html { redirect_to @building_product, notice: 'Building product was successfully created.' }
        format.json { render :show, status: :created, location: @building_product }
      else
        format.html { render :new }
        format.json { render json: @building_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_products/1
  # PATCH/PUT /building_products/1.json
  def update
    respond_to do |format|
      if @building_product.update(building_product_params)
        format.html { redirect_to @building_product, notice: 'Building product was successfully updated.' }
        format.json { render :show, status: :ok, location: @building_product }
      else
        format.html { render :edit }
        format.json { render json: @building_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_products/1
  # DELETE /building_products/1.json
  def destroy
    @building_product.destroy
    respond_to do |format|
      format.html { redirect_to building_products_url, notice: 'Building product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_product
      @building_product = BuildingProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_product_params
      params.require(:building_product).permit(:building_id, :product_id, :quantity)
    end
end
