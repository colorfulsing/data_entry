require 'test_helper'

class ProyectoProgramasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proyecto_programa = proyecto_programas(:one)
  end

  test "should get index" do
    get proyecto_programas_url
    assert_response :success
  end

  test "should get new" do
    get new_proyecto_programa_url
    assert_response :success
  end

  test "should create proyecto_programa" do
    assert_difference('ProyectoPrograma.count') do
      post proyecto_programas_url, params: { proyecto_programa: { descripcion: @proyecto_programa.descripcion, id_instituto: @proyecto_programa.id_instituto, id_status: @proyecto_programa.id_status, nombre: @proyecto_programa.nombre } }
    end

    assert_redirected_to proyecto_programa_url(ProyectoPrograma.last)
  end

  test "should show proyecto_programa" do
    get proyecto_programa_url(@proyecto_programa)
    assert_response :success
  end

  test "should get edit" do
    get edit_proyecto_programa_url(@proyecto_programa)
    assert_response :success
  end

  test "should update proyecto_programa" do
    patch proyecto_programa_url(@proyecto_programa), params: { proyecto_programa: { descripcion: @proyecto_programa.descripcion, id_instituto: @proyecto_programa.id_instituto, id_status: @proyecto_programa.id_status, nombre: @proyecto_programa.nombre } }
    assert_redirected_to proyecto_programa_url(@proyecto_programa)
  end

  test "should destroy proyecto_programa" do
    assert_difference('ProyectoPrograma.count', -1) do
      delete proyecto_programa_url(@proyecto_programa)
    end

    assert_redirected_to proyecto_programas_url
  end
end
