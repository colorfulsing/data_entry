class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication
  before_action :authenticate_user!
  before_action :admin_only_access

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      respond_to do |format|
        format.html { redirect_to usuarios_path, notice: 'El Usuario se creo exitosamente.' }
        format.json { render :show, status: :created, location: usuarios_path }
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private
    def admin_only_access
      redirect_to home_path unless current_user.admin?
    end
end
