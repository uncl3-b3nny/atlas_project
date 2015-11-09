class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :edit, :update, :destroy]
# to do: Dry up this controller
  def index
    @designs = Design.all
  end

  def show
  end

  def new
    @design = Design.new

    # @participant = DesignParticipant.find params[:participant_id]
    @catalogue = Catalogue.find params[:catalogue_id]
    @region = Region.find params[:region_id]
    @country = Country.find params[:country_id]  

    @raw_materials = RawMaterial.all
    @parts = Part.all
    @assemblies = Assembly.all
    @floorplans = Floorplan.all   
    @buildings = Building.all
  
  end

  def edit
    @raw_materials = RawMaterial.all
    @parts = Part.all
    @assemblies = Assembly.all
    @floorplans = Floorplan.all
    @buildings = Building.all
  end

  def create
    @catalogue = Catalogue.find params[:catalogue_id]
    @region = Region.find params[:region_id]
    @country = Country.find params[:country_id]

    @design = @catalogue.designs.new(design_params)
    p @design
      if @design.save
        flash[:notice] = "Design was successfully created"
        CatalogueDesign.create!(design_id: @design.id, catalogue_id: @catalogue.id)  
        redirect_to country_region_catalogue_path(@country, @region, @catalogue)
      else
        flash[:error] = "Design was not successfully created"
        render :new
      end
  end

  def update
    @catalogue = Catalogue.find params[:catalogue_id]
    @region = Region.find params[:region_id]
    @country = Country.find params[:country_id]
      if @design.update(design_params)
        flash[:notice] = "Design was successfully updated"
        redirect_to country_region_catalogue_path(@country, @region, @catalogue)
      else
        flash[:error] = "Design was not successfully updated"
        render :new
      end
  end

  def destroy
    @design.destroy
    respond_to do |format|
      format.html { redirect_to designs_url, notice: 'Design was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @design = Design.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def design_params
      params.require(:design).permit(
        :name, 
        :designer,
        :catalogue_id,
        # :designer_id[],
        :part_id,
        :assembly_id,
        :floorplan_id
        )
    end
end
