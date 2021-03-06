class ProyectosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :load_facultad, only: [:edit, :update, :new, :create]
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy, :asociate_area]
  before_action :load_area, only: [:show]
  before_action :load_config
  before_action :config_audit, only: [:create, :update, :destroy, :asociate_area]

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.search.page params[:page]
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
    ActiveRecord::Base.transaction do
      @proyecto = Proyecto.new(proyecto_params)

      respond_to do |format|
        if @proyecto.save
          format.html { redirect_to @proyecto, notice: 'Proyecto programa se cre&oacute; exitosamente.' }
          format.json { render :show, status: :created, location: @proyecto }
        else
          format.html { render :new }
          format.json { render json: @proyecto.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    ActiveRecord::Base.transaction do
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
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    ActiveRecord::Base.transaction do
      @proyecto.status = Status.find(Status::VALUES[:deleted])
      @proyecto.save validate: false
      respond_to do |format|
        format.html { redirect_to proyectos_url, notice: 'Proyecto programa se marco como borrado.' }
        format.json { head :no_content }
      end
    end
  end

  def asociate_area
    ActiveRecord::Base.transaction do
      form_params = proyecto_area_params
      area_id = form_params[:id_area]
      @area = Area.find(area_id)
      existing_asociation = ProyectoArea.where(id_area: area_id, id_proyecto: @proyecto.id)

      respond_to do |format|
        if existing_asociation.blank?
          ProyectoArea.create id_proyecto: @proyecto.id, id_area: area_id
          format.html { redirect_to @proyecto, notice: "Se agrego el area \"#{@area.nombre}\" exitosamente." }
          format.json { render :show, status: :ok, location: @proyecto }
        else
          existing_asociation.destroy_all
          format.html { redirect_to @proyecto, notice: "Se quito el area \"#{@area.nombre}\" exitosamente." }
          format.json { render :show, status: :ok, location: @proyecto }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    def load_status
      @statuses = Status.user_visible
    end

    def load_facultad
      @facultades = Facultad.all
    end

    def load_area
      @areas = Area.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:id_instituto, :nombre, :descripcion, :id_status)
    end

    def proyecto_area_params
      params.require(:proyecto_area).permit(:id_area)
    end

    def load_config
      @search_type = [Proyecto.search_entity_class]
    end
end
