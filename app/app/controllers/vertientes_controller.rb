class VertientesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_vertiente, only: [:show, :edit, :update, :destroy]
  before_action :load_config
  before_action :config_audit, only: [:create, :update, :destroy]

  # GET /vertientes
  # GET /vertientes.json
  def index
    @vertientes = Vertiente.search.page params[:page]
  end

  # GET /vertientes/1
  # GET /vertientes/1.json
  def show
  end

  # GET /vertientes/new
  def new
    @vertiente = Vertiente.new
  end

  # GET /vertientes/1/edit
  def edit
  end

  # POST /vertientes
  # POST /vertientes.json
  def create
    ActiveRecord::Base.transaction do
      @vertiente = Vertiente.new(vertiente_params)

      respond_to do |format|
        if @vertiente.save
          format.html { redirect_to @vertiente, notice: 'La Vertiente se cre&oacute; exitosamente.' }
          format.json { render :show, status: :created, location: @vertiente }
        else
          format.html { render :new }
          format.json { render json: @vertiente.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /vertientes/1
  # PATCH/PUT /vertientes/1.json
  def update
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @vertiente.update(vertiente_params)
          format.html { redirect_to @vertiente, notice: 'La Vertiente se actualizo correctamente.' }
          format.json { render :show, status: :ok, location: @vertiente }
        else
          format.html { render :edit }
          format.json { render json: @vertiente.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /vertientes/1
  # DELETE /vertientes/1.json
  def destroy
    ActiveRecord::Base.transaction do
      @vertiente.status = Status.find(Status::VALUES[:deleted])
      @vertiente.save validate: false
      respond_to do |format|
        format.html { redirect_to vertientes_url, notice: 'La Vertiente se marco como borrada.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertiente
      @vertiente = Vertiente.find(params[:id])
    end

    def load_status
      @statuses = Status.user_visible
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vertiente_params
      params.require(:vertiente).permit(:nombre, :id_status)
    end

    def load_config
      @search_type = [Vertiente.search_entity_class]
    end
end
