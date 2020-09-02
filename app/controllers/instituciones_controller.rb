class InstitucionesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_institucion, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  # GET /instituciones
  # GET /instituciones.json
  def index
    @instituciones = Institucion.search.page params[:page]
  end

  # GET /instituciones/1
  # GET /instituciones/1.json
  def show
    @facultades = @institucion.facultades.includes([:status]).order(:nombre).page params[:page]
  end

  # GET /instituciones/new
  def new
    @institucion = Institucion.new
  end

  # GET /instituciones/1/edit
  def edit
  end

  # POST /instituciones
  # POST /instituciones.json
  def create
    @institucion = Institucion.new(institucion_params)

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to @institucion, notice: 'La Institucion se creo exitosamente.' }
        format.json { render :show, status: :created, location: @institucion }
      else
        format.html { render :new }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituciones/1
  # PATCH/PUT /instituciones/1.json
  def update
    respond_to do |format|
      if @institucion.update(institucion_params)
        format.html { redirect_to @institucion, notice: 'La Institucion se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @institucion }
      else
        format.html { render :edit }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituciones/1
  # DELETE /instituciones/1.json
  def destroy
    @institucion.status = Status.find(Status::VALUES[:deleted])
    @institucion.save validate: false
    respond_to do |format|
      format.html { redirect_to instituciones_url, notice: 'La Institucion se marco como borrada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institucion
      @institucion = Institucion.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institucion_params
      params.require(:institucion).permit(:nombre, :siglas, :telefono, :direccion, :correo_electronico, :sitio_web, :id_status)
    end

    def load_config
      @search_type = [Institucion.search_entity_class]
    end
end
