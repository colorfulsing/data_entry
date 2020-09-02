class InvestigacionesController < ApplicationController
  before_action :set_investigacione, only: [:show, :edit, :update, :destroy]

  # GET /investigaciones
  # GET /investigaciones.json
  def index
    @investigaciones = Investigacione.all
  end

  # GET /investigaciones/1
  # GET /investigaciones/1.json
  def show
  end

  # GET /investigaciones/new
  def new
    @investigacione = Investigacione.new
  end

  # GET /investigaciones/1/edit
  def edit
  end

  # POST /investigaciones
  # POST /investigaciones.json
  def create
    @investigacione = Investigacione.new(investigacione_params)

    respond_to do |format|
      if @investigacione.save
        format.html { redirect_to @investigacione, notice: 'Investigacione was successfully created.' }
        format.json { render :show, status: :created, location: @investigacione }
      else
        format.html { render :new }
        format.json { render json: @investigacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigaciones/1
  # PATCH/PUT /investigaciones/1.json
  def update
    respond_to do |format|
      if @investigacione.update(investigacione_params)
        format.html { redirect_to @investigacione, notice: 'Investigacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @investigacione }
      else
        format.html { render :edit }
        format.json { render json: @investigacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigaciones/1
  # DELETE /investigaciones/1.json
  def destroy
    @investigacione.destroy
    respond_to do |format|
      format.html { redirect_to investigaciones_url, notice: 'Investigacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigacione
      @investigacione = Investigacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigacione_params
      params.require(:investigacione).permit(:id_instituto, :id_microcuenca, :id_municipio, :id_documento, :autor, :titulo, :no_paginas, :fecha_realizacion, :fecha_publicacion, :resumen, :palabras_clave, :recurso_web, :id_status)
    end
end
