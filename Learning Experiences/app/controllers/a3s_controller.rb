class A3sController < ApplicationController
  before_action :set_a3, only: [:show, :edit, :update, :destroy]

  # GET /a3s
  # GET /a3s.json
  def index
    @a3s = A3.all
  end

  # GET /a3s/1
  # GET /a3s/1.json
  def show
  end

  # GET /a3s/new
  def new
    @a3 = A3.new
  end

  # GET /a3s/1/edit
  def edit
  end

  # POST /a3s
  # POST /a3s.json
  def create
    @a3 = A3.new(a3_params)

    respond_to do |format|
      if @a3.save
        format.html { redirect_to @a3, notice: 'A3 was successfully created.' }
        format.json { render :show, status: :created, location: @a3 }
      else
        format.html { render :new }
        format.json { render json: @a3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a3s/1
  # PATCH/PUT /a3s/1.json
  def update
    respond_to do |format|
      if @a3.update(a3_params)
        format.html { redirect_to @a3, notice: 'A3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @a3 }
      else
        format.html { render :edit }
        format.json { render json: @a3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a3s/1
  # DELETE /a3s/1.json
  def destroy
    @a3.destroy
    respond_to do |format|
      format.html { redirect_to a3s_url, notice: 'A3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a3
      @a3 = A3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a3_params
      params[:a3]
    end
end
