class DepartamentosController < ApplicationController
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  def search_entity_class
    Departamento.name
  end

  # GET /departamentos
  # GET /departamentos.json
  def index
    @departamentos = Departamento.all.includes([:status]).order(:nombre).page params[:page]
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'El Departamento se creo exitosamente.' }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to @departamento, notice: 'El Departamento se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.status = Status.find(Status::VALUES[:deleted])
    @departamento.save validate: false
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'El Departamento se marco como borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departamento_params
      params.require(:departamento).permit(:nombre, :id_status)
    end

    def load_config
      @search_type = [search_entity_class]
    end
end
