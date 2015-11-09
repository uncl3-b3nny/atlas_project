class FactoryManufacturingProcessesController < ApplicationController
  before_action :set_factory_manufacturing_process, only: [:show, :edit, :update, :destroy]

  # GET /factory_manufacturing_processes
  # GET /factory_manufacturing_processes.json
  def index
    @factory_manufacturing_processes = FactoryManufacturingProcess.all
  end

  # GET /factory_manufacturing_processes/1
  # GET /factory_manufacturing_processes/1.json
  def show
  end

  # GET /factory_manufacturing_processes/new
  def new
    @factory_manufacturing_process = FactoryManufacturingProcess.new
  end

  # GET /factory_manufacturing_processes/1/edit
  def edit
  end

  # POST /factory_manufacturing_processes
  # POST /factory_manufacturing_processes.json
  def create
    @factory_manufacturing_process = FactoryManufacturingProcess.new(factory_manufacturing_process_params)

    respond_to do |format|
      if @factory_manufacturing_process.save
        format.html { redirect_to @factory_manufacturing_process, notice: 'Factory manufacturing process was successfully created.' }
        format.json { render :show, status: :created, location: @factory_manufacturing_process }
      else
        format.html { render :new }
        format.json { render json: @factory_manufacturing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factory_manufacturing_processes/1
  # PATCH/PUT /factory_manufacturing_processes/1.json
  def update
    respond_to do |format|
      if @factory_manufacturing_process.update(factory_manufacturing_process_params)
        format.html { redirect_to @factory_manufacturing_process, notice: 'Factory manufacturing process was successfully updated.' }
        format.json { render :show, status: :ok, location: @factory_manufacturing_process }
      else
        format.html { render :edit }
        format.json { render json: @factory_manufacturing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_manufacturing_processes/1
  # DELETE /factory_manufacturing_processes/1.json
  def destroy
    @factory_manufacturing_process.destroy
    respond_to do |format|
      format.html { redirect_to factory_manufacturing_processes_url, notice: 'Factory manufacturing process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory_manufacturing_process
      @factory_manufacturing_process = FactoryManufacturingProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factory_manufacturing_process_params
      params.require(:factory_manufacturing_process).permit(:factory_id, :manufacturing_process_id)
    end
end
