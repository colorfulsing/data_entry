class CuencasController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :load_vertiente, only: [:edit, :update, :new, :create]
  before_action :set_cuenca, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  # GET /cuencas
  # GET /cuencas.json
  def index
    @cuencas = Cuenca.search.page params[:page]
  end

  # GET /cuencas/1
  # GET /cuencas/1.json
  def show
  end

  # GET /cuencas/new
  def new
    @cuenca = Cuenca.new
  end

  # GET /cuencas/1/edit
  def edit
  end

  # POST /cuencas
  # POST /cuencas.json
  def create
    @cuenca = Cuenca.new(cuenca_params)

    respond_to do |format|
      if @cuenca.save
        format.html { redirect_to @cuenca, notice: 'La Cuenca se creo exitosamente.' }
        format.json { render :show, status: :created, location: @cuenca }
      else
        format.html { render :new }
        format.json { render json: @cuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuencas/1
  # PATCH/PUT /cuencas/1.json
  def update
    respond_to do |format|
      if @cuenca.update(cuenca_params)
        format.html { redirect_to @cuenca, notice: 'La Cuenca se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @cuenca }
      else
        format.html { render :edit }
        format.json { render json: @cuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuencas/1
  # DELETE /cuencas/1.json
  def destroy
    @cuenca.status = Status.find(Status::VALUES[:deleted])
    @cuenca.save validate: false
    respond_to do |format|
      format.html { redirect_to cuencas_url, notice: 'La Cuenca se marco como borrada.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    query = params[:term]
    search_expression = convert_to_search_expression query
    limit = APP_CONFIG['autocomplete_limit']
    @collection = []
    unless search_expression.blank?
      @collection = Cuenca.search(query).limit(limit)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuenca
      @cuenca = Cuenca.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    def load_vertiente
      @vertientes = Vertiente.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuenca_params
      params.require(:cuenca).permit(:id_vertiente, :nombre, :id_status)
    end

    def load_config
      @search_type = [Cuenca.search_entity_class]
    end
end
