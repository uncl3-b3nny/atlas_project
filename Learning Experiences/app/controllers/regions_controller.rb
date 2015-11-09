class RegionsController < ApplicationController
  before_action :set_country, only: [:show, :new, :edit, :create, :update, :destroy]
  before_action :set_region, only: [:show, :edit, :update, :destroy] # rename this in every controller to '@local_resource' for use in your helper methods

  def index
    @regions = Region.all
  end

  def show
  end

  def new
    @country = Country.find params[:country_id]
    @region = Region.new(:country_id => params[:country_id])
  end

  def edit
  end

  def create
    @region = @country.regions.new(region_params)

      if @region.save
        flash[:notice] = "Region was successfully created"
        redirect_to country_path(@country)
      else
        flash[:error] = "Region was not successfully created"
        render :new
      end
  end

  def update
    if @region.update(region_params)
      flash[:notice] = "Region was successfully updated"
      redirect_to country_region_path(@country, @region)
    else
      flash[:error] = "Region was not successfully updated"
      render :new
    end
  end

  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    def set_country
      @country = Country.find(params[:country_id])
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(
        :name, 
        :description, 
        :climate, 
        :country_id,
        :population,
        :approved,
        :estimated_occupants_per_single_family_home_unit,
        :estimated_occupants_per_multi_family_home_unit,
        :estimated_single_family_home_demand,
        :estimated_multi_family_home_demand,
        :percent_market_penetration_goal,
        :average_estimated_home_value,
        :percent_margin)
    end
end
