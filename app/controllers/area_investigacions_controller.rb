class AreaInvestigacionsController < ApplicationController
  before_action :set_area_investigacion, only: [:show, :edit, :update, :destroy]

  # GET /area_investigacions
  # GET /area_investigacions.json
  def index
    @area_investigacions = AreaInvestigacion.all
  end

  # GET /area_investigacions/1
  # GET /area_investigacions/1.json
  def show
  end

  # GET /area_investigacions/new
  def new
    @area_investigacion = AreaInvestigacion.new
  end

  # GET /area_investigacions/1/edit
  def edit
  end

  # POST /area_investigacions
  # POST /area_investigacions.json
  def create
    @area_investigacion = AreaInvestigacion.new(area_investigacion_params)

    respond_to do |format|
      if @area_investigacion.save
        format.html { redirect_to @area_investigacion, notice: 'Area investigacion was successfully created.' }
        format.json { render :show, status: :created, location: @area_investigacion }
      else
        format.html { render :new }
        format.json { render json: @area_investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_investigacions/1
  # PATCH/PUT /area_investigacions/1.json
  def update
    respond_to do |format|
      if @area_investigacion.update(area_investigacion_params)
        format.html { redirect_to @area_investigacion, notice: 'Area investigacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_investigacion }
      else
        format.html { render :edit }
        format.json { render json: @area_investigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_investigacions/1
  # DELETE /area_investigacions/1.json
  def destroy
    @area_investigacion.destroy
    respond_to do |format|
      format.html { redirect_to area_investigacions_url, notice: 'Area investigacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_investigacion
      @area_investigacion = AreaInvestigacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_investigacion_params
      params.require(:area_investigacion).permit(:id_investigacion, :id_area)
    end
end
