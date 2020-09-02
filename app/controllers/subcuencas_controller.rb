class SubcuencasController < ApplicationController
  before_action :set_subcuenca, only: [:show, :edit, :update, :destroy]

  # GET /subcuencas
  # GET /subcuencas.json
  def index
    @subcuencas = Subcuenca.all
  end

  # GET /subcuencas/1
  # GET /subcuencas/1.json
  def show
  end

  # GET /subcuencas/new
  def new
    @subcuenca = Subcuenca.new
  end

  # GET /subcuencas/1/edit
  def edit
  end

  # POST /subcuencas
  # POST /subcuencas.json
  def create
    @subcuenca = Subcuenca.new(subcuenca_params)

    respond_to do |format|
      if @subcuenca.save
        format.html { redirect_to @subcuenca, notice: 'Subcuenca was successfully created.' }
        format.json { render :show, status: :created, location: @subcuenca }
      else
        format.html { render :new }
        format.json { render json: @subcuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcuencas/1
  # PATCH/PUT /subcuencas/1.json
  def update
    respond_to do |format|
      if @subcuenca.update(subcuenca_params)
        format.html { redirect_to @subcuenca, notice: 'Subcuenca was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcuenca }
      else
        format.html { render :edit }
        format.json { render json: @subcuenca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcuencas/1
  # DELETE /subcuencas/1.json
  def destroy
    @subcuenca.destroy
    respond_to do |format|
      format.html { redirect_to subcuencas_url, notice: 'Subcuenca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcuenca
      @subcuenca = Subcuenca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcuenca_params
      params.require(:subcuenca).permit(:id_cuenca, :nombre, :id_status)
    end
end
