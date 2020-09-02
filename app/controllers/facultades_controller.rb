class FacultadesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :load_tipo_instituto, only: [:show, :edit, :update, :new, :create]
  before_action :load_institucion, only: [:edit, :update, :new, :create]
  before_action :set_facultad, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  # GET /facultades
  # GET /facultades.json
  def index
    @facultades = Facultad.search.page params[:page]
  end

  # GET /facultades/1
  # GET /facultades/1.json
  def show
  end

  # GET /facultades/new
  def new
    @facultad = Facultad.new
  end

  # GET /facultades/1/edit
  def edit
  end

  # POST /facultades
  # POST /facultades.json
  def create
    @facultad = Facultad.new(facultad_params)

    respond_to do |format|
      if @facultad.save
        format.html { redirect_to @facultad, notice: 'Facultades instituto se creo exitosamente.' }
        format.json { render :show, status: :created, location: @facultad }
      else
        format.html { render :new }
        format.json { render json: @facultad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facultades/1
  # PATCH/PUT /facultades/1.json
  def update
    respond_to do |format|
      if @facultad.update(facultad_params)
        format.html { redirect_to @facultad, notice: 'Facultades instituto se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @facultad }
      else
        format.html { render :edit }
        format.json { render json: @facultad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facultades/1
  # DELETE /facultades/1.json
  def destroy
    @facultad.status = Status.find(Status::VALUES[:deleted])
    @facultad.save validate: false
    respond_to do |format|
      format.html { redirect_to facultades_url, notice: 'Facultades instituto se marco como borrada..' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    query = params[:term]
    search_expression = convert_to_search_expression query
    limit = APP_CONFIG['autocomplete_limit']
    @collection = []
    unless search_expression.blank?
      @collection = Facultad.search(query).limit(limit)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facultad
      @facultad = Facultad.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    def load_tipo_instituto
      @tipo_institutos = TipoInstituto.all
    end

    def load_institucion
      @instituciones = Institucion.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facultad_params
      params.require(:facultad).permit(:id_institucion, :tipo_instituto, :nombre, :siglas, :telefono, :extension, :direccion, :correo_electronico, :sitio_web, :id_status)
    end

    def load_config
      @search_type = [Facultad.search_entity_class]
    end
end
