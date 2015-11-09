class QuantitiesController < ApplicationController
  before_action :set_quantity, only: [:show, :edit, :update, :destroy]

  def index
    @quantities = Quantity.all
  end

  def show
  end

  def new
    @quantity = Quantity.new
  end

  def edit
  end

  def create
    @quantity = Quantity.new(quantity_params)

    respond_to do |format|
      if @quantity.save
        format.html { redirect_to @quantity, notice: 'Quantity was successfully created.' }
        format.json { render :show, status: :created, location: @quantity }
      else
        format.html { render :new }
        format.json { render json: @quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quantity.update(quantity_params)
        format.html { redirect_to @quantity, notice: 'Quantity was successfully updated.' }
        format.json { render :show, status: :ok, location: @quantity }
      else
        format.html { render :edit }
        format.json { render json: @quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quantity.destroy
    respond_to do |format|
      format.html { redirect_to quantities_url, notice: 'Quantity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quantity
      @quantity = Quantity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quantity_params
      params.require(:part).permit(
        :quantity, 
        :building_id, 
        :a5_id, 
        :a4_id, 
        :a3_id, 
        :a2_id, 
        :assembly_id, 
        :part_id, 
        :raw_material_id, 
        :milestone_id, 
        :labor_id, 
        :credit_id, 
        :debt_id, 
        :inventory_id, 
        :participant_id)
    end
end
