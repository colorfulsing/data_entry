require 'test_helper'

class InvestigacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investigacione = investigaciones(:one)
  end

  test "should get index" do
    get investigaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_investigacione_url
    assert_response :success
  end

  test "should create investigacione" do
    assert_difference('Investigacione.count') do
      post investigaciones_url, params: { investigacione: { autor: @investigacione.autor, fecha_publicacion: @investigacione.fecha_publicacion, fecha_realizacion: @investigacione.fecha_realizacion, id_documento: @investigacione.id_documento, id_instituto: @investigacione.id_instituto, id_microcuenca: @investigacione.id_microcuenca, id_municipio: @investigacione.id_municipio, id_status: @investigacione.id_status, no_paginas: @investigacione.no_paginas, palabras_clave: @investigacione.palabras_clave, recurso_web: @investigacione.recurso_web, resumen: @investigacione.resumen, titulo: @investigacione.titulo } }
    end

    assert_redirected_to investigacione_url(Investigacione.last)
  end

  test "should show investigacione" do
    get investigacione_url(@investigacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_investigacione_url(@investigacione)
    assert_response :success
  end

  test "should update investigacione" do
    patch investigacione_url(@investigacione), params: { investigacione: { autor: @investigacione.autor, fecha_publicacion: @investigacione.fecha_publicacion, fecha_realizacion: @investigacione.fecha_realizacion, id_documento: @investigacione.id_documento, id_instituto: @investigacione.id_instituto, id_microcuenca: @investigacione.id_microcuenca, id_municipio: @investigacione.id_municipio, id_status: @investigacione.id_status, no_paginas: @investigacione.no_paginas, palabras_clave: @investigacione.palabras_clave, recurso_web: @investigacione.recurso_web, resumen: @investigacione.resumen, titulo: @investigacione.titulo } }
    assert_redirected_to investigacione_url(@investigacione)
  end

  test "should destroy investigacione" do
    assert_difference('Investigacione.count', -1) do
      delete investigacione_url(@investigacione)
    end

    assert_redirected_to investigaciones_url
  end
end
