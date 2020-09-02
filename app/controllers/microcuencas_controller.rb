class MicrocuencasController < ApplicationController
  before_action :set_microcuenca, only: [:show, :edit, :update, :destroy]

  # GET /microcuencas
  # GET /microcuencas.json
  def index
    @microcuencas = Microcuenca.all
  end

  # GET /microcuencas/1
  # GET /microcuencas/1.json
  def show
  end

  # GET /microcuencas/new
  def new
    @microcuenca = Microcuenca.new
  end

  # GET /microcuencas/1/edit
  def edit
  end

  # POST /microcuencas
  # POST /microcuencas.json
  def create
    @microcuenca = Microcuenca.new(microcuenca_params)

    respond_to do |format|
      if @microcuenca.save
        format.html { redirect_to @microcuenca, notice: 'Microcuenca was successfully created.' }
        format.json { render :show, status: :created, location: @microcuenca }
      else
        format.html { render :new }
        format.json { render json: @microcuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microcuencas/1
  # PATCH/PUT /microcuencas/1.json
  def update
    respond_to do |format|
      if @microcuenca.update(microcuenca_params)
        format.html { redirect_to @microcuenca, notice: 'Microcuenca was successfully updated.' }
        format.json { render :show, status: :ok, location: @microcuenca }
      else
        format.html { render :edit }
        format.json { render json: @microcuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microcuencas/1
  # DELETE /microcuencas/1.json
  def destroy
    @microcuenca.destroy
    respond_to do |format|
      format.html { redirect_to microcuencas_url, notice: 'Microcuenca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_microcuenca
      @microcuenca = Microcuenca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def microcuenca_params
      params.require(:microcuenca).permit(:id_subcuenca, :nombre, :id_status)
    end
end
