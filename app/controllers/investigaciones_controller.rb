class InvestigacionesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :load_facultad, only: [:edit, :update, :new, :create]
  before_action :load_tipo_documento, only: [:edit, :update, :new, :create]
  before_action :set_investigacion, only: [:show, :edit, :update, :destroy, :asociate_area]
  before_action :load_area, only: [:show]
  before_action :load_config

  # GET /investigaciones
  # GET /investigaciones.json
  def index
    @investigaciones = Investigacion.search.page params[:page]
  end

  # GET /investigaciones/1
  # GET /investigaciones/1.json
  def show
  end

  # GET /investigaciones/new
  def new
    @investigacion = Investigacion.new
  end

  # GET /investigaciones/1/edit
  def edit
  end

  # POST /investigaciones
  # POST /investigaciones.json
  def create
    @investigacion = Investigacion.new(investigacion_params)

    respond_to do |format|
      if @investigacion.save
        format.html { redirect_to @investigacion, notice: 'La Investigacion se cre&oacute; exitosamente.' }
        format.json { render :show, status: :created, location: @investigacion }
      else
        format.html { render :new }
        format.json { render json: @investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigaciones/1
  # PATCH/PUT /investigaciones/1.json
  def update
    respond_to do |format|
      if @investigacion.update(investigacion_params)
        format.html { redirect_to @investigacion, notice: 'La Investigacion se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @investigacion }
      else
        format.html { render :edit }
        format.json { render json: @investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigaciones/1
  # DELETE /investigaciones/1.json
  def destroy
    @investigacion.status = Status.find(Status::VALUES[:deleted])
    @investigacion.save validate: false
    respond_to do |format|
      format.html { redirect_to investigaciones_url, notice: 'La Investigacion se marco como borrada.' }
      format.json { head :no_content }
    end
  end

  def asociate_area
    form_params = investigacion_area_params
    area_id = form_params[:id_area]
    @area = Area.find(area_id)
    existing_asociation = AreaInvestigacion.where(id_area: area_id, id_investigacion: @investigacion.id)

    respond_to do |format|
      if existing_asociation.blank?
        AreaInvestigacion.create id_investigacion: @investigacion.id, id_area: area_id
        format.html { redirect_to @investigacion, notice: "Se agrego el area \"#{@area.nombre}\" exitosamente." }
        format.json { render :show, status: :ok, location: @investigacion }
      else
        existing_asociation.delete_all
        format.html { redirect_to @investigacion, notice: "Se quito el area \"#{@area.nombre}\" exitosamente." }
        format.json { render :show, status: :ok, location: @investigacion }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigacion
      @investigacion = Investigacion.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    def load_facultad
      @facultades = Facultad.all
    end

    def load_tipo_documento
      @tipo_documentos = TipoDocumento.all
    end

    def load_area
      @areas = Area.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigacion_params
      params.require(:investigacion).permit(:id_instituto, :id_microcuenca, :id_municipio, :id_documento, :autor, :titulo, :no_paginas, :fecha_realizacion, :fecha_publicacion, :resumen, :palabras_clave, :recurso_web, :id_status)
    end

    def investigacion_area_params
      params.require(:investigacion_area).permit(:id_area)
    end

    def load_config
      @search_type = [Investigacion.search_entity_class]
    end
end
