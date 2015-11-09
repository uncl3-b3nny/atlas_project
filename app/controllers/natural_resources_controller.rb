class NaturalResourcesController < ApplicationController
  before_action :set_natural_resource, only: [:show, :edit, :update, :destroy]

  # GET /natural_resources
  # GET /natural_resources.json
  def index
    @natural_resources = NaturalResource.all
  end

  # GET /natural_resources/1
  # GET /natural_resources/1.json
  def show
  end

  # GET /natural_resources/new
  def new
    @natural_resource = NaturalResource.new
  end

  # GET /natural_resources/1/edit
  def edit
  end

  # POST /natural_resources
  # POST /natural_resources.json
  def create
    @natural_resource = NaturalResource.new(natural_resource_params)

    respond_to do |format|
      if @natural_resource.save
        format.html { redirect_to @natural_resource, notice: 'Natural resource was successfully created.' }
        format.json { render :show, status: :created, location: @natural_resource }
      else
        format.html { render :new }
        format.json { render json: @natural_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /natural_resources/1
  # PATCH/PUT /natural_resources/1.json
  def update
    respond_to do |format|
      if @natural_resource.update(natural_resource_params)
        format.html { redirect_to @natural_resource, notice: 'Natural resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @natural_resource }
      else
        format.html { render :edit }
        format.json { render json: @natural_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /natural_resources/1
  # DELETE /natural_resources/1.json
  def destroy
    @natural_resource.destroy
    respond_to do |format|
      format.html { redirect_to natural_resources_url, notice: 'Natural resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_natural_resource
      @natural_resource = NaturalResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def natural_resource_params
      params.require(:natural_resource).permit(:name, :quantity)
    end
end
