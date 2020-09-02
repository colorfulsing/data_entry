class ProyectoAreasController < ApplicationController
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_proyecto_area, only: [:show, :edit, :update, :destroy]

  # GET /proyecto_areas
  # GET /proyecto_areas.json
  def index
    @proyecto_areas = ProyectoArea.all
  end

  # GET /proyecto_areas/1
  # GET /proyecto_areas/1.json
  def show
  end

  # GET /proyecto_areas/new
  def new
    @proyecto_area = ProyectoArea.new
  end

  # GET /proyecto_areas/1/edit
  def edit
  end

  # POST /proyecto_areas
  # POST /proyecto_areas.json
  def create
    @proyecto_area = ProyectoArea.new(proyecto_area_params)

    respond_to do |format|
      if @proyecto_area.save
        format.html { redirect_to @proyecto_area, notice: 'Proyecto area was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto_area }
      else
        format.html { render :new }
        format.json { render json: @proyecto_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyecto_areas/1
  # PATCH/PUT /proyecto_areas/1.json
  def update
    respond_to do |format|
      if @proyecto_area.update(proyecto_area_params)
        format.html { redirect_to @proyecto_area, notice: 'Proyecto area was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto_area }
      else
        format.html { render :edit }
        format.json { render json: @proyecto_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_areas/1
  # DELETE /proyecto_areas/1.json
  def destroy
    @proyecto_area.status = Status.find(Status::VALUES[:deleted])
    @proyecto_area.save validate: false
    respond_to do |format|
      format.html { redirect_to proyecto_areas_url, notice: 'Proyecto area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto_area
      @proyecto_area = ProyectoArea.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_area_params
      params.require(:proyecto_area).permit(:id_proyecto, :id_area)
    end
end
