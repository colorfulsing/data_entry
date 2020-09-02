require 'test_helper'

class MunicipiosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @municipio = municipios(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get municipios_url
    assert_response :success
  end

  test "should get new" do
    get new_municipio_url
    assert_response :success
  end

  test "should create municipio" do
    assert_difference('Municipio.count') do
      post municipios_url, params: { municipio: { id_departamento: @municipio.id_departamento, id_status: @municipio.id_status, nombre: @municipio.nombre } }
    end

    assert_redirected_to municipio_url(Municipio.last)
  end

  test "should show municipio" do
    get municipio_url(@municipio)
    assert_response :success
  end

  test "should get edit" do
    get edit_municipio_url(@municipio)
    assert_response :success
  end

  test "should update municipio" do
    patch municipio_url(@municipio), params: { municipio: { id_departamento: @municipio.id_departamento, id_status: @municipio.id_status, nombre: @municipio.nombre } }
    assert_redirected_to municipio_url(@municipio)
  end

  test "should destroy municipio" do
    assert_no_difference('Municipio.count') do
      delete municipio_url(@municipio)
    end
    @municipio.reload
    assert @municipio.status.deleted?

    assert_redirected_to municipios_url
  end
end
