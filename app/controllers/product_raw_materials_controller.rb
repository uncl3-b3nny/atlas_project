class ProductRawMaterialsController < ApplicationController
  before_action :set_product_raw_material, only: [:show, :edit, :update, :destroy]

  # GET /product_raw_materials
  # GET /product_raw_materials.json
  def index
    @product_raw_materials = ProductRawMaterial.all
  end

  # GET /product_raw_materials/1
  # GET /product_raw_materials/1.json
  def show
  end

  # GET /product_raw_materials/new
  def new
    @product_raw_material = ProductRawMaterial.new
  end

  # GET /product_raw_materials/1/edit
  def edit
  end

  # POST /product_raw_materials
  # POST /product_raw_materials.json
  def create
    @product_raw_material = ProductRawMaterial.new(product_raw_material_params)

    respond_to do |format|
      if @product_raw_material.save
        format.html { redirect_to @product_raw_material, notice: 'Product raw material was successfully created.' }
        format.json { render :show, status: :created, location: @product_raw_material }
      else
        format.html { render :new }
        format.json { render json: @product_raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_raw_materials/1
  # PATCH/PUT /product_raw_materials/1.json
  def update
    respond_to do |format|
      if @product_raw_material.update(product_raw_material_params)
        format.html { redirect_to @product_raw_material, notice: 'Product raw material was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_raw_material }
      else
        format.html { render :edit }
        format.json { render json: @product_raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_raw_materials/1
  # DELETE /product_raw_materials/1.json
  def destroy
    @product_raw_material.destroy
    respond_to do |format|
      format.html { redirect_to product_raw_materials_url, notice: 'Product raw material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_raw_material
      @product_raw_material = ProductRawMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_raw_material_params
      params.require(:product_raw_material).permit(:raw_material_id, :product_id, :quantity)
    end
end
