class StatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only_access
  before_action :load_status, only: [:show, :edit, :update, :new, :create]
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  before_action :load_config
  before_action :config_audit, only: [:create, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.search.page params[:page]
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    ActiveRecord::Base.transaction do
      @status = Status.new(status_params)

      respond_to do |format|
        if @status.save
          format.html { redirect_to @status, notice: 'El Estado se cre&oacute; exitosamente.' }
          format.json { render :show, status: :created, location: @status }
        else
          format.html { render :new }
          format.json { render json: @status.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @status.update(status_params)
          format.html { redirect_to @status, notice: 'El Estado se actualizo correctamente.' }
          format.json { render :show, status: :ok, location: @status }
        else
          format.html { render :edit }
          format.json { render json: @status.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    ActiveRecord::Base.transaction do
      # Validate if status can be deleted
      unless @status.can_be_deleted?
        error_message = 'El Estado no puede borrarse porque esta en uso.'
        respond_to do |format|
          format.html { redirect_to statuses_url, notice: error_message }
          format.json { render json: [error_message], status: :unprocessable_entity }
        end
        return
      end

      # Delete status permanently
      @status.destroy
      respond_to do |format|
        format.html { redirect_to statuses_url, notice: 'El Estado se elimino permanentemente.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    def load_status
      @statuses = Status.user_visible
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:nombre, :visible)
    end

    def load_config
      @search_type = [Status.search_entity_class]
    end
end
