class LaborsController < ApplicationController
  before_action :set_labor, only: [:show, :edit, :update, :destroy]

  # GET /labors
  # GET /labors.json
  def index
    @labors = Labor.all
  end

  # GET /labors/1
  # GET /labors/1.json
  def show
  end

  # GET /labors/new
  def new
    @labor = Labor.new
  end

  # GET /labors/1/edit
  def edit
  end

  # POST /labors
  # POST /labors.json
  def create
    @labor = Labor.new(labor_params)

    respond_to do |format|
      if @labor.save
        format.html { redirect_to @labor, notice: 'Labor was successfully created.' }
        format.json { render :show, status: :created, location: @labor }
      else
        format.html { render :new }
        format.json { render json: @labor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labors/1
  # PATCH/PUT /labors/1.json
  def update
    respond_to do |format|
      if @labor.update(labor_params)
        format.html { redirect_to @labor, notice: 'Labor was successfully updated.' }
        format.json { render :show, status: :ok, location: @labor }
      else
        format.html { render :edit }
        format.json { render json: @labor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labors/1
  # DELETE /labors/1.json
  def destroy
    @labor.destroy
    respond_to do |format|
      format.html { redirect_to labors_url, notice: 'Labor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labor
      @labor = Labor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labor_params
      params[:labor]
    end
end
