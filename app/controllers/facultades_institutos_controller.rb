class FacultadesInstitutosController < ApplicationController
  before_action :set_facultades_instituto, only: [:show, :edit, :update, :destroy]

  # GET /facultades_institutos
  # GET /facultades_institutos.json
  def index
    @facultades_institutos = FacultadesInstituto.all
  end

  # GET /facultades_institutos/1
  # GET /facultades_institutos/1.json
  def show
  end

  # GET /facultades_institutos/new
  def new
    @facultades_instituto = FacultadesInstituto.new
  end

  # GET /facultades_institutos/1/edit
  def edit
  end

  # POST /facultades_institutos
  # POST /facultades_institutos.json
  def create
    @facultades_instituto = FacultadesInstituto.new(facultades_instituto_params)

    respond_to do |format|
      if @facultades_instituto.save
        format.html { redirect_to @facultades_instituto, notice: 'Facultades instituto was successfully created.' }
        format.json { render :show, status: :created, location: @facultades_instituto }
      else
        format.html { render :new }
        format.json { render json: @facultades_instituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facultades_institutos/1
  # PATCH/PUT /facultades_institutos/1.json
  def update
    respond_to do |format|
      if @facultades_instituto.update(facultades_instituto_params)
        format.html { redirect_to @facultades_instituto, notice: 'Facultades instituto was successfully updated.' }
        format.json { render :show, status: :ok, location: @facultades_instituto }
      else
        format.html { render :edit }
        format.json { render json: @facultades_instituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facultades_institutos/1
  # DELETE /facultades_institutos/1.json
  def destroy
    @facultades_instituto.destroy
    respond_to do |format|
      format.html { redirect_to facultades_institutos_url, notice: 'Facultades instituto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facultades_instituto
      @facultades_instituto = FacultadesInstituto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facultades_instituto_params
      params.require(:facultades_instituto).permit(:id_instituciones, :nombre, :siglas, :telefono, :extension, :direccion, :correo_electronico, :sitio_web, :id_status)
    end
end
