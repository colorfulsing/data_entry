class AreaInvestigacionesController < ApplicationController
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_area_investigacion, only: [:show, :edit, :update, :destroy]

  # GET /area_investigaciones
  # GET /area_investigaciones.json
  def index
    @area_investigaciones = AreaInvestigacion.all
  end

  # GET /area_investigaciones/1
  # GET /area_investigaciones/1.json
  def show
  end

  # GET /area_investigaciones/new
  def new
    @area_investigacion = AreaInvestigacion.new
  end

  # GET /area_investigaciones/1/edit
  def edit
  end

  # POST /area_investigaciones
  # POST /area_investigaciones.json
  def create
    @area_investigacion = AreaInvestigacion.new(area_investigacion_params)

    respond_to do |format|
      if @area_investigacion.save
        format.html { redirect_to @area_investigacion, notice: 'Area investigacion se creo exitosamente.' }
        format.json { render :show, status: :created, location: @area_investigacion }
      else
        format.html { render :new }
        format.json { render json: @area_investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_investigaciones/1
  # PATCH/PUT /area_investigaciones/1.json
  def update
    respond_to do |format|
      if @area_investigacion.update(area_investigacion_params)
        format.html { redirect_to @area_investigacion, notice: 'Area investigacion se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @area_investigacion }
      else
        format.html { render :edit }
        format.json { render json: @area_investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_investigaciones/1
  # DELETE /area_investigaciones/1.json
  def destroy
    @area_investigacion.status = Status.find(Status::VALUES[:deleted])
    @area_investigacion.save validate: false
    respond_to do |format|
      format.html { redirect_to area_investigaciones_url, notice: 'Area investigacion se marco como borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_investigacion
      @area_investigacion = AreaInvestigacion.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_investigacion_params
      params.require(:area_investigacion).permit(:id_investigacion, :id_area)
    end
end
