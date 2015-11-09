class AtlasRegistrationsController < ApplicationController
  before_action :set_atlas_registration, only: [:show, :edit, :update, :destroy]

  # GET /atlas_registrations
  # GET /atlas_registrations.json
  def index
    @atlas_registrations = AtlasRegistration.all
  end

  # GET /atlas_registrations/1
  # GET /atlas_registrations/1.json
  def show
  end

  # GET /atlas_registrations/new
  def new
    @atlas_registration = AtlasRegistration.new
  end

  # GET /atlas_registrations/1/edit
  def edit
  end

  # POST /atlas_registrations
  # POST /atlas_registrations.json
  def create
    @atlas_registration = AtlasRegistration.new(atlas_registration_params)

    respond_to do |format|
      if @atlas_registration.save
        format.html { redirect_to @atlas_registration, notice: 'Atlas registration was successfully created.' }
        format.json { render :show, status: :created, location: @atlas_registration }
      else
        format.html { render :new }
        format.json { render json: @atlas_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atlas_registrations/1
  # PATCH/PUT /atlas_registrations/1.json
  def update
    respond_to do |format|
      if @atlas_registration.update(atlas_registration_params)
        format.html { redirect_to @atlas_registration, notice: 'Atlas registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @atlas_registration }
      else
        format.html { render :edit }
        format.json { render json: @atlas_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atlas_registrations/1
  # DELETE /atlas_registrations/1.json
  def destroy
    @atlas_registration.destroy
    respond_to do |format|
      format.html { redirect_to atlas_registrations_url, notice: 'Atlas registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atlas_registration
      @atlas_registration = AtlasRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atlas_registration_params
      params[:atlas_registration]
    end
end
