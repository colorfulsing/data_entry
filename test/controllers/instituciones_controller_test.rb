require 'test_helper'

class InstitucionesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @institucion = institucions(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get instituciones_url
    assert_response :success
  end

  test "should get new" do
    get new_institucion_url
    assert_response :success
  end

  test "should create institucione" do
    assert_difference('Institucion.count') do
      post instituciones_url, params: { institucion: { correo_electronico: @institucion.correo_electronico, direccion: @institucion.direccion, id_status: @institucion.status.id, nombre: @institucion.nombre, siglas: @institucion.siglas, sitio_web: @institucion.sitio_web, telefono: @institucion.telefono } }
    end

    assert_redirected_to institucion_url(Institucion.last)
  end

  test "should show institucione" do
    get institucion_url(@institucion)
    assert_response :success
  end

  test "should get edit" do
    get edit_institucion_url(@institucion)
    assert_response :success
  end

  test "should update institucione" do
    patch institucion_url(@institucion), params: { institucion: { correo_electronico: @institucion.correo_electronico, direccion: @institucion.direccion, id_status: @institucion.status.id, nombre: @institucion.nombre, siglas: @institucion.siglas, sitio_web: @institucion.sitio_web, telefono: @institucion.telefono } }
    assert_redirected_to institucion_url(@institucion)
  end

  test "should destroy institucione" do
    assert_no_difference('Institucion.count') do
      delete institucion_url(@institucion)
    end
    @institucion.reload
    assert @institucion.status.deleted?

    assert_redirected_to instituciones_url
  end
end
