class TipoInstitutosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_tipo_instituto, only: [:show, :edit, :update, :destroy]
  before_action :load_config

  # GET /tipo_institutos
  # GET /tipo_institutos.json
  def index
    @tipo_institutos = TipoInstituto.search.page params[:page]
  end

  # GET /tipo_institutos/1
  # GET /tipo_institutos/1.json
  def show
  end

  # GET /tipo_institutos/new
  def new
    @tipo_instituto = TipoInstituto.new
  end

  # GET /tipo_institutos/1/edit
  def edit
  end

  # POST /tipo_institutos
  # POST /tipo_institutos.json
  def create
    @tipo_instituto = TipoInstituto.new(tipo_instituto_params)

    respond_to do |format|
      if @tipo_instituto.save
        format.html { redirect_to @tipo_instituto, notice: 'El Tipo Instituto se cre&oacute; exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_instituto }
      else
        format.html { render :new }
        format.json { render json: @tipo_instituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_institutos/1
  # PATCH/PUT /tipo_institutos/1.json
  def update
    respond_to do |format|
      if @tipo_instituto.update(tipo_instituto_params)
        format.html { redirect_to @tipo_instituto, notice: 'El Tipo Instituto se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @tipo_instituto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_instituto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_institutos/1
  # DELETE /tipo_institutos/1.json
  def destroy
    @tipo_instituto.status = Status.find(Status::VALUES[:deleted])
    @tipo_instituto.save validate: false
    respond_to do |format|
      format.html { redirect_to tipo_institutos_url, notice: 'El Tipo Instituto se marco como borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_instituto
      @tipo_instituto = TipoInstituto.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_instituto_params
      params.require(:tipo_instituto).permit(:nombre, :descripcion, :id_status)
    end

    def load_config
      @search_type = [TipoInstituto.search_entity_class]
    end
end
