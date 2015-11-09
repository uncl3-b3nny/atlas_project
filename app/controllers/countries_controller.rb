class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
    @country_assemblies =[]
    #so in order for me to pull up all the assemblies that belong to a country, I need to query all the quantities that belong_to @country THROUGH its subsidiaries, then find the quantities that have an assembly_id & and a [subsidiary]_id. Squeel's Quantity.where{builiding_id.like_any @country.buildings} should work... right?

    # @country.quantities.each do |quantity|
    #     @country_assemblies.push(quantity.assembly)
    # end
    
    # to do: make this a helper that accepts the appropriate objects and builds the necessary arrays for the entity being shown. 
    
     #Some querying notes:
      # Post.includes(:author, { comments: { author: :gravatar } }).each do |post|
      # The above code will load all the comments and all of their associated authors and gravatars. You can mix and match any combination of symbols, arrays, and hashes to retrieve the associations you want to load.

      # If you want to load all posts (including posts with no approved comments) then write your own LEFT OUTER JOIN query using ON

      # Post.joins("LEFT OUTER JOIN comments ON comments.post_id = posts.id AND comments.approved = '1'")
            # to do: play with the SQUEEL gem! it looks great for active record queries

  end

  def new
    @country = Country.new
  end

  def edit
  end

  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(
        :abbreviation,
        :name, 
        :population,
        :approved,
        :estimated_occupants_per_single_family_home_unit,
        :estimated_occupants_per_multi_family_home_unit,
        :estimated_single_family_home_demand,
        :estimated_multi_family_home_demand,
        :percent_market_penetration_goal,
        :average_estimated_home_value,
        :percent_margin, 
        :upkeep_cost_of_means_of_production, 
        :cost_of_means_of_production, 
        :market_price, 
        :market_bulk_discount, 
        :additional_discount_needed_to_close_deal
        )
    end
end
