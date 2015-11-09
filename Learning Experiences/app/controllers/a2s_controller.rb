class A2sController < ApplicationController
  before_action :set_a2, only: [:show, :edit, :update, :destroy]

  # GET /a2s
  # GET /a2s.json
  def index
    @a2s = A2.all
  end

  # GET /a2s/1
  # GET /a2s/1.json
  def show
  end

  # GET /a2s/new
  def new
    @a2 = A2.new
  end

  # GET /a2s/1/edit
  def edit
  end

  # POST /a2s
  # POST /a2s.json
  def create
    @a2 = A2.new(a2_params)

    respond_to do |format|
      if @a2.save
        format.html { redirect_to @a2, notice: 'A2 was successfully created.' }
        format.json { render :show, status: :created, location: @a2 }
      else
        format.html { render :new }
        format.json { render json: @a2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a2s/1
  # PATCH/PUT /a2s/1.json
  def update
    respond_to do |format|
      if @a2.update(a2_params)
        format.html { redirect_to @a2, notice: 'A2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @a2 }
      else
        format.html { render :edit }
        format.json { render json: @a2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a2s/1
  # DELETE /a2s/1.json
  def destroy
    @a2.destroy
    respond_to do |format|
      format.html { redirect_to a2s_url, notice: 'A2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a2
      @a2 = A2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a2_params
      params[:a2]
    end
end
