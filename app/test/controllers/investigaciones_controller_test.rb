require 'test_helper'

class InvestigacionesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @investigacion = investigacions(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get investigaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_investigacion_url
    assert_response :success
  end

  test "should create investigacion" do
    assert_difference('Investigacion.count') do
      post investigaciones_url, params: { investigacion: { autor: @investigacion.autor, fecha_publicacion: @investigacion.fecha_publicacion, fecha_realizacion: @investigacion.fecha_realizacion, id_documento: @investigacion.tipo_documento.id, id_instituto: @investigacion.facultad.id, id_microcuenca: @investigacion.microcuenca.id, id_municipio: @investigacion.municipio.id, id_status: @investigacion.status.id, no_paginas: @investigacion.no_paginas, palabras_clave: @investigacion.palabras_clave, recurso_web: @investigacion.recurso_web, resumen: @investigacion.resumen, titulo: @investigacion.titulo } }
    end

    assert_redirected_to investigacion_url(Investigacion.last)
  end

  test "should show investigacion" do
    get investigacion_url(@investigacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_investigacion_url(@investigacion)
    assert_response :success
  end

  test "should update investigacion" do
    patch investigacion_url(@investigacion), params: { investigacion: { autor: @investigacion.autor, fecha_publicacion: @investigacion.fecha_publicacion, fecha_realizacion: @investigacion.fecha_realizacion, id_documento: @investigacion.tipo_documento.id, id_instituto: @investigacion.facultad.id, id_microcuenca: @investigacion.microcuenca.id, id_municipio: @investigacion.municipio.id, id_status: @investigacion.status.id, no_paginas: @investigacion.no_paginas, palabras_clave: @investigacion.palabras_clave, recurso_web: @investigacion.recurso_web, resumen: @investigacion.resumen, titulo: @investigacion.titulo } }
    assert_redirected_to investigacion_url(@investigacion)
  end

  test "should destroy investigacion" do
    assert_no_difference('Investigacion.count') do
      delete investigacion_url(@investigacion)
    end
    @investigacion.reload
    assert @investigacion.status.deleted?

    assert_redirected_to investigaciones_url
  end
end
