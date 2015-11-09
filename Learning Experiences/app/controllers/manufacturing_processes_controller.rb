class ManufacturingProcessesController < ApplicationController
  before_action :set_manufacturing_process, only: [:show, :edit, :update, :destroy]

  # GET /manufacturing_processes
  # GET /manufacturing_processes.json
  def index
    @manufacturing_processes = ManufacturingProcess.all
  end

  # GET /manufacturing_processes/1
  # GET /manufacturing_processes/1.json
  def show
  end

  # GET /manufacturing_processes/new
  def new
    @manufacturing_process = ManufacturingProcess.new
  end

  # GET /manufacturing_processes/1/edit
  def edit
  end

  # POST /manufacturing_processes
  # POST /manufacturing_processes.json
  def create
    @manufacturing_process = ManufacturingProcess.new(manufacturing_process_params)

    respond_to do |format|
      if @manufacturing_process.save
        format.html { redirect_to @manufacturing_process, notice: 'Manufacturing process was successfully created.' }
        format.json { render :show, status: :created, location: @manufacturing_process }
      else
        format.html { render :new }
        format.json { render json: @manufacturing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturing_processes/1
  # PATCH/PUT /manufacturing_processes/1.json
  def update
    respond_to do |format|
      if @manufacturing_process.update(manufacturing_process_params)
        format.html { redirect_to @manufacturing_process, notice: 'Manufacturing process was successfully updated.' }
        format.json { render :show, status: :ok, location: @manufacturing_process }
      else
        format.html { render :edit }
        format.json { render json: @manufacturing_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturing_processes/1
  # DELETE /manufacturing_processes/1.json
  def destroy
    @manufacturing_process.destroy
    respond_to do |format|
      format.html { redirect_to manufacturing_processes_url, notice: 'Manufacturing process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturing_process
      @manufacturing_process = ManufacturingProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manufacturing_process_params
      params.require(:manufacturing_process).permit(:name)
    end
end
