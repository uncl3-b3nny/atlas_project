class CataloguesController < ApplicationController
  before_action :set_country, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_region, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_catalogue, only: [:show, :edit, :update, :destroy]

  def index
    @catalogues = Catalogue.all
  end

  def show
  end

  def new
    @region = Region.find params[:region_id]
    @catalogue = Catalogue.new(:region_id => params[:region_id])
  end

  def edit
  end

  def create
    #I should probably create another join table for catalogue designs, so we can re-use designs in other catalogues. For now, I'm just going to get this working. 
    @catalogue = @region.catalogues.new(catalogue_params)
      if @catalogue.save
        flash[:notice] = "Catalogue was successfully created"
        redirect_to country_region_catalogue_path(@country, @region, @catalogue)
      else
        flash[:error] = "Catalogue was not successfully created"
        render :new
      end
  end

  def update 
    if @catalogue.update
      flash[:notice] = "Catalogue was successfully updated"
      redirect_to country_region_catalogue_path(@country, @region, @catalogue)
    else
      flash[:error] = "Catalogue was not successfully updated"
      render :edit
    end
  end

  def destroy
    @catalogue.destroy
    respond_to do |format|
      format.html { redirect_to catalogues_url, notice: 'Catalogue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_country
      @country = Country.find(params[:country_id])
    end 

    def set_region
      @region = Region.find(params[:region_id])
    end

    def set_catalogue
      @catalogue = Catalogue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalogue_params
      params.require(:catalogue).permit(:name, :region_id)
    end
end
