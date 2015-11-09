class ConstructionSchedulesController < ApplicationController
  before_action :set_construction_schedule, only: [:show, :edit, :update, :destroy]

  # GET /construction_schedules
  # GET /construction_schedules.json
  def index
    @construction_schedules = ConstructionSchedule.all
  end

  # GET /construction_schedules/1
  # GET /construction_schedules/1.json
  def show
  end

  # GET /construction_schedules/new
  def new
    @construction_schedule = ConstructionSchedule.new
  end

  # GET /construction_schedules/1/edit
  def edit
  end

  # POST /construction_schedules
  # POST /construction_schedules.json
  def create
    @construction_schedule = ConstructionSchedule.new(construction_schedule_params)

    respond_to do |format|
      if @construction_schedule.save
        format.html { redirect_to @construction_schedule, notice: 'Construction schedule was successfully created.' }
        format.json { render :show, status: :created, location: @construction_schedule }
      else
        format.html { render :new }
        format.json { render json: @construction_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_schedules/1
  # PATCH/PUT /construction_schedules/1.json
  def update
    respond_to do |format|
      if @construction_schedule.update(construction_schedule_params)
        format.html { redirect_to @construction_schedule, notice: 'Construction schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_schedule }
      else
        format.html { render :edit }
        format.json { render json: @construction_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_schedules/1
  # DELETE /construction_schedules/1.json
  def destroy
    @construction_schedule.destroy
    respond_to do |format|
      format.html { redirect_to construction_schedules_url, notice: 'Construction schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_schedule
      @construction_schedule = ConstructionSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def construction_schedule_params
      params.require(:construction_schedule).permit(:building_id, :lot_id)
    end
end
