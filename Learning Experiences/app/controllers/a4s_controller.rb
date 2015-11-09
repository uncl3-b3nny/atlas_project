class A4sController < ApplicationController
  before_action :set_a4, only: [:show, :edit, :update, :destroy]

  # GET /a4s
  # GET /a4s.json
  def index
    @a4s = A4.all
  end

  # GET /a4s/1
  # GET /a4s/1.json
  def show
  end

  # GET /a4s/new
  def new
    @a4 = A4.new
  end

  # GET /a4s/1/edit
  def edit
  end

  # POST /a4s
  # POST /a4s.json
  def create
    @a4 = A4.new(a4_params)

    respond_to do |format|
      if @a4.save
        format.html { redirect_to @a4, notice: 'A4 was successfully created.' }
        format.json { render :show, status: :created, location: @a4 }
      else
        format.html { render :new }
        format.json { render json: @a4.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a4s/1
  # PATCH/PUT /a4s/1.json
  def update
    respond_to do |format|
      if @a4.update(a4_params)
        format.html { redirect_to @a4, notice: 'A4 was successfully updated.' }
        format.json { render :show, status: :ok, location: @a4 }
      else
        format.html { render :edit }
        format.json { render json: @a4.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a4s/1
  # DELETE /a4s/1.json
  def destroy
    @a4.destroy
    respond_to do |format|
      format.html { redirect_to a4s_url, notice: 'A4 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a4
      @a4 = A4.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a4_params
      params[:a4]
    end
end
