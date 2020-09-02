require 'cgi'

class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only_access, except: [:edit, :update]
  before_action :load_status, only: [:show, :edit, :update]
  before_action :set_usuario, only: [:show, :edit, :update, :enable, :disable, :destroy]
  before_action :validate_current_user_access, only: [:edit, :update]
  before_action :load_config

  # GET /usuarios
  # GET /usuarios.json
  def index
    @users = User.search.page params[:page]
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/1/edit
  def edit
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      validate_current_password
      @user.assign_attributes(usuario_params)
      if @user.errors.blank? && @user.update(usuario_params)
        format.html { redirect_to @user, notice: 'El Usuario se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def enable
    return if current_user.id == @user.id
    @user.status = Status.find(Status::VALUES[:active])
    @user.save validate: false
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "El usuario #{@user.email} se habilito." }
      format.json { head :no_content }
    end
  end

  def disable
    return if current_user.id == @user.id
    @user.status = Status.find(Status::VALUES[:inactive])
    @user.save validate: false
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "El usuario #{@user.email} se desabilito." }
      format.json { head :no_content }
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    return if current_user.id == @user.id
    @user.status = Status.find(Status::VALUES[:deleted])
    @user.save validate: false
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "El usuario #{@user.email} se marco como borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @user = User.find(params[:id])
    end

    def load_status
      @statuses = Status.all
    end

    def would_change_password
      password_params = params.require(:user).permit(:password, :password_confirmation)
      !password_params[:password].blank? || !password_params[:password_confirmation].blank?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      allowed_params = [:nombre, :telefono]
      if current_user.admin?
        allowed_params << :email
        allowed_params << :role
        allowed_params << :id_status
      end
      if would_change_password
        allowed_params << :password
        allowed_params << :password_confirmation
      end
      params.require(:user).permit(allowed_params)
    end

    def load_config
      @search_type = [User.search_entity_class]
    end

    def validate_current_user_access
      return if current_user.admin? || current_user.id == @user.id
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end

    def validate_current_password
      return if current_user.id != @user.id
      current_password = params.require(:user).permit(:current_password)[:current_password]
      return if @user.valid_password? current_password
      @user.errors.add('Contrase&ntilde;a actual', 'no es valid.')
    end
end
