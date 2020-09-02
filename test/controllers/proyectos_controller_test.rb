require 'test_helper'

class ProyectosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @proyecto = proyectos(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get proyectos_url
    assert_response :success
  end

  test "should get new" do
    get new_proyecto_url
    assert_response :success
  end

  test "should create proyecto" do
    assert_difference('Proyecto.count') do
      post proyectos_url, params: { proyecto: { descripcion: @proyecto.descripcion, id_instituto: @proyecto.id_instituto, id_status: @proyecto.id_status, nombre: @proyecto.nombre } }
    end

    assert_redirected_to proyecto_url(Proyecto.last)
  end

  test "should show proyecto" do
    get proyecto_url(@proyecto)
    assert_response :success
  end

  test "should get edit" do
    get edit_proyecto_url(@proyecto)
    assert_response :success
  end

  test "should update proyecto" do
    patch proyecto_url(@proyecto), params: { proyecto: { descripcion: @proyecto.descripcion, id_instituto: @proyecto.id_instituto, id_status: @proyecto.id_status, nombre: @proyecto.nombre } }
    assert_redirected_to proyecto_url(@proyecto)
  end

  test "should destroy proyecto" do
    assert_no_difference('Proyecto.count') do
      delete proyecto_url(@proyecto)
    end
    @proyecto.reload
    assert @proyecto.status.deleted?

    assert_redirected_to proyectos_url
  end
end
