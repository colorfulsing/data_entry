class ProyectosController < ApplicationController
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  def search_entity_class
    Proyecto.name
  end

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all.includes([:status]).order(:nombre).page params[:page]
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto programa se creo exitosamente.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: 'Proyecto programa se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.status = Status.find(Status::VALUES[:deleted])
    @proyecto.save validate: false
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto programa se marco como borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:id_instituto, :nombre, :descripcion, :id_status)
    end

    def load_config
      @search_type = [search_entity_class]
    end
end
