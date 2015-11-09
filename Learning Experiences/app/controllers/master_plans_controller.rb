class MasterPlansController < ApplicationController
  before_action :set_region, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_country, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_master_plan, only: [:show, :edit, :update, :destroy]

  # GET /master_plans
  # GET /master_plans.json
  def index
    @master_plans = MasterPlan.all
  end

  # GET /master_plans/1
  # GET /master_plans/1.json
  def show
  end

  # GET /master_plans/new
  def new
  @master_plan = MasterPlan.new(:region_id => params[:region_id])
  end

  # GET /master_plans/1/edit
  def edit
  end

  # POST /master_plans
  # POST /master_plans.json
  def create
    @master_plan = @region.master_plans.new(master_plan_params)

    if @master_plan.save
      flash[:notice] = "Master Plan was successfully created"
      redirect_to country_region_master_plan_path(@country, @region, @master_plan)
    else
      flash[:error] = "Master Plan was not successfully created"
      render :new
    end

  end

  # PATCH/PUT /master_plans/1
  # PATCH/PUT /master_plans/1.json
  def update
    if @master_plan.update(master_plan_params)
      flash[:notice] = "Master Plan was successfully updated"
      redirect_to country_region_master_plan_path(@country, @region, @master_plan)
    else
      flash[:error] = "Master Plan was not successfully updated"
      render :new
    end
  end

  # DELETE /master_plans/1
  # DELETE /master_plans/1.json
  def destroy
    @master_plan.destroy
    respond_to do |format|
      format.html { redirect_to country_region_master_plans_path(@country, @regions), notice: 'Master plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_plan
      @master_plan = MasterPlan.find(params[:id])
    end
    
    def set_region
      @region = Region.find(params[:region_id])
    end

    def set_country
      @country = @region.country
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_plan_params
      params.require(:master_plan).permit(
        :name, 
        :region_id, 
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
