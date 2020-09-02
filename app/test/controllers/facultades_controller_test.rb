require 'test_helper'

class FacultadesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @facultad = facultads(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get facultades_url
    assert_response :success
  end

  test "should get new" do
    get new_facultad_url
    assert_response :success
  end

  test "should create facultad" do
    assert_difference('Facultad.count') do
      post facultades_url, params: { facultad: { correo_electronico: @facultad.correo_electronico, direccion: @facultad.direccion, extension: @facultad.extension, id_institucion: @facultad.institucion.id, id_status: @facultad.status.id, nombre: @facultad.nombre, siglas: @facultad.siglas, sitio_web: @facultad.sitio_web, telefono: @facultad.telefono, id_tipo_instituto: @facultad.tipo_instituto.id } }
    end

    assert_redirected_to facultad_url(Facultad.last)
  end

  test "should show facultad" do
    get facultad_url(@facultad)
    assert_response :success
  end

  test "should get edit" do
    get edit_facultad_url(@facultad)
    assert_response :success
  end

  test "should update facultad" do
    patch facultad_url(@facultad), params: { facultad: { correo_electronico: @facultad.correo_electronico, direccion: @facultad.direccion, extension: @facultad.extension, id_institucion: @facultad.institucion.id, id_status: @facultad.id_status, nombre: @facultad.nombre, siglas: @facultad.siglas, sitio_web: @facultad.sitio_web, telefono: @facultad.telefono, id_tipo_instituto: @facultad.tipo_instituto.id } }
    assert_redirected_to facultad_url(@facultad)
  end

  test "should destroy facultad" do
    assert_no_difference('Facultad.count') do
      delete facultad_url(@facultad)
    end
    @facultad.reload
    assert @facultad.status.deleted?

    assert_redirected_to facultades_url
  end
end
