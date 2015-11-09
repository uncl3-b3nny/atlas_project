class A5sController < ApplicationController
  before_action :set_a5, only: [:show, :edit, :update, :destroy]

  # GET /a5s
  # GET /a5s.json
  def index
    @a5s = A5.all
  end

  # GET /a5s/1
  # GET /a5s/1.json
  def show
  end

  # GET /a5s/new
  def new
    @a5 = A5.new
  end

  # GET /a5s/1/edit
  def edit
  end

  # POST /a5s
  # POST /a5s.json
  def create
    @a5 = A5.new(a5_params)

    respond_to do |format|
      if @a5.save
        format.html { redirect_to @a5, notice: 'A5 was successfully created.' }
        format.json { render :show, status: :created, location: @a5 }
      else
        format.html { render :new }
        format.json { render json: @a5.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a5s/1
  # PATCH/PUT /a5s/1.json
  def update
    respond_to do |format|
      if @a5.update(a5_params)
        format.html { redirect_to @a5, notice: 'A5 was successfully updated.' }
        format.json { render :show, status: :ok, location: @a5 }
      else
        format.html { render :edit }
        format.json { render json: @a5.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a5s/1
  # DELETE /a5s/1.json
  def destroy
    @a5.destroy
    respond_to do |format|
      format.html { redirect_to a5s_url, notice: 'A5 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a5
      @a5 = A5.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def a5_params
      params[:a5]
    end
end
