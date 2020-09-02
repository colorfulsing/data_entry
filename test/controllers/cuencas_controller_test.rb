require 'test_helper'

class CuencasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenca = cuencas(:one)
  end

  test "should get index" do
    get cuencas_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenca_url
    assert_response :success
  end

  test "should create cuenca" do
    assert_difference('Cuenca.count') do
      post cuencas_url, params: { cuenca: { id_status: @cuenca.id_status, id_vertiente: @cuenca.id_vertiente, nombre: @cuenca.nombre } }
    end

    assert_redirected_to cuenca_url(Cuenca.last)
  end

  test "should show cuenca" do
    get cuenca_url(@cuenca)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenca_url(@cuenca)
    assert_response :success
  end

  test "should update cuenca" do
    patch cuenca_url(@cuenca), params: { cuenca: { id_status: @cuenca.id_status, id_vertiente: @cuenca.id_vertiente, nombre: @cuenca.nombre } }
    assert_redirected_to cuenca_url(@cuenca)
  end

  test "should destroy cuenca" do
    assert_difference('Cuenca.count', -1) do
      delete cuenca_url(@cuenca)
    end

    assert_redirected_to cuencas_url
  end
end
