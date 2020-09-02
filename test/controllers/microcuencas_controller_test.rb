require 'test_helper'

class MicrocuencasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @microcuenca = microcuencas(:one)
  end

  test "should get index" do
    get microcuencas_url
    assert_response :success
  end

  test "should get new" do
    get new_microcuenca_url
    assert_response :success
  end

  test "should create microcuenca" do
    assert_difference('Microcuenca.count') do
      post microcuencas_url, params: { microcuenca: { id_status: @microcuenca.id_status, id_subcuenca: @microcuenca.id_subcuenca, nombre: @microcuenca.nombre } }
    end

    assert_redirected_to microcuenca_url(Microcuenca.last)
  end

  test "should show microcuenca" do
    get microcuenca_url(@microcuenca)
    assert_response :success
  end

  test "should get edit" do
    get edit_microcuenca_url(@microcuenca)
    assert_response :success
  end

  test "should update microcuenca" do
    patch microcuenca_url(@microcuenca), params: { microcuenca: { id_status: @microcuenca.id_status, id_subcuenca: @microcuenca.id_subcuenca, nombre: @microcuenca.nombre } }
    assert_redirected_to microcuenca_url(@microcuenca)
  end

  test "should destroy microcuenca" do
    assert_difference('Microcuenca.count', -1) do
      delete microcuenca_url(@microcuenca)
    end

    assert_redirected_to microcuencas_url
  end
end
