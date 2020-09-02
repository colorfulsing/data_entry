class ProyectoProgramasController < ApplicationController
  before_action :set_proyecto_programa, only: [:show, :edit, :update, :destroy]

  # GET /proyecto_programas
  # GET /proyecto_programas.json
  def index
    @proyecto_programas = ProyectoPrograma.all
  end

  # GET /proyecto_programas/1
  # GET /proyecto_programas/1.json
  def show
  end

  # GET /proyecto_programas/new
  def new
    @proyecto_programa = ProyectoPrograma.new
  end

  # GET /proyecto_programas/1/edit
  def edit
  end

  # POST /proyecto_programas
  # POST /proyecto_programas.json
  def create
    @proyecto_programa = ProyectoPrograma.new(proyecto_programa_params)

    respond_to do |format|
      if @proyecto_programa.save
        format.html { redirect_to @proyecto_programa, notice: 'Proyecto programa was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto_programa }
      else
        format.html { render :new }
        format.json { render json: @proyecto_programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyecto_programas/1
  # PATCH/PUT /proyecto_programas/1.json
  def update
    respond_to do |format|
      if @proyecto_programa.update(proyecto_programa_params)
        format.html { redirect_to @proyecto_programa, notice: 'Proyecto programa was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto_programa }
      else
        format.html { render :edit }
        format.json { render json: @proyecto_programa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_programas/1
  # DELETE /proyecto_programas/1.json
  def destroy
    @proyecto_programa.destroy
    respond_to do |format|
      format.html { redirect_to proyecto_programas_url, notice: 'Proyecto programa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto_programa
      @proyecto_programa = ProyectoPrograma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_programa_params
      params.require(:proyecto_programa).permit(:id_instituto, :nombre, :descripcion, :id_status)
    end
end
