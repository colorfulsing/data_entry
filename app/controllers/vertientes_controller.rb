class VertientesController < ApplicationController
  before_action :set_vertiente, only: [:show, :edit, :update, :destroy]

  # GET /vertientes
  # GET /vertientes.json
  def index
    @vertientes = Vertiente.all
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
    @vertiente = Vertiente.new(vertiente_params)

    respond_to do |format|
      if @vertiente.save
        format.html { redirect_to @vertiente, notice: 'Vertiente was successfully created.' }
        format.json { render :show, status: :created, location: @vertiente }
      else
        format.html { render :new }
        format.json { render json: @vertiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vertientes/1
  # PATCH/PUT /vertientes/1.json
  def update
    respond_to do |format|
      if @vertiente.update(vertiente_params)
        format.html { redirect_to @vertiente, notice: 'Vertiente was successfully updated.' }
        format.json { render :show, status: :ok, location: @vertiente }
      else
        format.html { render :edit }
        format.json { render json: @vertiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vertientes/1
  # DELETE /vertientes/1.json
  def destroy
    @vertiente.destroy
    respond_to do |format|
      format.html { redirect_to vertientes_url, notice: 'Vertiente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vertiente
      @vertiente = Vertiente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vertiente_params
      params.require(:vertiente).permit(:nombre, :id_status)
    end
end
