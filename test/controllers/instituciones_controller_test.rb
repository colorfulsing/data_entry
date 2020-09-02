require 'test_helper'

class InstitucionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @institucione = instituciones(:one)
  end

  test "should get index" do
    get instituciones_url
    assert_response :success
  end

  test "should get new" do
    get new_institucione_url
    assert_response :success
  end

  test "should create institucione" do
    assert_difference('Institucione.count') do
      post instituciones_url, params: { institucione: { correo_electronico: @institucione.correo_electronico, direccion: @institucione.direccion, id_status: @institucione.id_status, nombre: @institucione.nombre, siglas: @institucione.siglas, sitio_web: @institucione.sitio_web, telefono: @institucione.telefono } }
    end

    assert_redirected_to institucione_url(Institucione.last)
  end

  test "should show institucione" do
    get institucione_url(@institucione)
    assert_response :success
  end

  test "should get edit" do
    get edit_institucione_url(@institucione)
    assert_response :success
  end

  test "should update institucione" do
    patch institucione_url(@institucione), params: { institucione: { correo_electronico: @institucione.correo_electronico, direccion: @institucione.direccion, id_status: @institucione.id_status, nombre: @institucione.nombre, siglas: @institucione.siglas, sitio_web: @institucione.sitio_web, telefono: @institucione.telefono } }
    assert_redirected_to institucione_url(@institucione)
  end

  test "should destroy institucione" do
    assert_difference('Institucione.count', -1) do
      delete institucione_url(@institucione)
    end

    assert_redirected_to instituciones_url
  end
end
