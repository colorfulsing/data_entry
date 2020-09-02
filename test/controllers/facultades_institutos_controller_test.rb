require 'test_helper'

class FacultadesInstitutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facultades_instituto = facultades_institutos(:one)
  end

  test "should get index" do
    get facultades_institutos_url
    assert_response :success
  end

  test "should get new" do
    get new_facultades_instituto_url
    assert_response :success
  end

  test "should create facultades_instituto" do
    assert_difference('FacultadesInstituto.count') do
      post facultades_institutos_url, params: { facultades_instituto: { correo_electronico: @facultades_instituto.correo_electronico, direccion: @facultades_instituto.direccion, extension: @facultades_instituto.extension, id_instituciones: @facultades_instituto.id_instituciones, id_status: @facultades_instituto.id_status, nombre: @facultades_instituto.nombre, siglas: @facultades_instituto.siglas, sitio_web: @facultades_instituto.sitio_web, telefono: @facultades_instituto.telefono } }
    end

    assert_redirected_to facultades_instituto_url(FacultadesInstituto.last)
  end

  test "should show facultades_instituto" do
    get facultades_instituto_url(@facultades_instituto)
    assert_response :success
  end

  test "should get edit" do
    get edit_facultades_instituto_url(@facultades_instituto)
    assert_response :success
  end

  test "should update facultades_instituto" do
    patch facultades_instituto_url(@facultades_instituto), params: { facultades_instituto: { correo_electronico: @facultades_instituto.correo_electronico, direccion: @facultades_instituto.direccion, extension: @facultades_instituto.extension, id_instituciones: @facultades_instituto.id_instituciones, id_status: @facultades_instituto.id_status, nombre: @facultades_instituto.nombre, siglas: @facultades_instituto.siglas, sitio_web: @facultades_instituto.sitio_web, telefono: @facultades_instituto.telefono } }
    assert_redirected_to facultades_instituto_url(@facultades_instituto)
  end

  test "should destroy facultades_instituto" do
    assert_difference('FacultadesInstituto.count', -1) do
      delete facultades_instituto_url(@facultades_instituto)
    end

    assert_redirected_to facultades_institutos_url
  end
end
