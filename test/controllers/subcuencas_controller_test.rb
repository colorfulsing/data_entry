require 'test_helper'

class SubcuencasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subcuenca = subcuencas(:one)
  end

  test "should get index" do
    get subcuencas_url
    assert_response :success
  end

  test "should get new" do
    get new_subcuenca_url
    assert_response :success
  end

  test "should create subcuenca" do
    assert_difference('Subcuenca.count') do
      post subcuencas_url, params: { subcuenca: { id_cuenca: @subcuenca.id_cuenca, id_status: @subcuenca.id_status, nombre: @subcuenca.nombre } }
    end

    assert_redirected_to subcuenca_url(Subcuenca.last)
  end

  test "should show subcuenca" do
    get subcuenca_url(@subcuenca)
    assert_response :success
  end

  test "should get edit" do
    get edit_subcuenca_url(@subcuenca)
    assert_response :success
  end

  test "should update subcuenca" do
    patch subcuenca_url(@subcuenca), params: { subcuenca: { id_cuenca: @subcuenca.id_cuenca, id_status: @subcuenca.id_status, nombre: @subcuenca.nombre } }
    assert_redirected_to subcuenca_url(@subcuenca)
  end

  test "should destroy subcuenca" do
    assert_difference('Subcuenca.count', -1) do
      delete subcuenca_url(@subcuenca)
    end

    assert_redirected_to subcuencas_url
  end
end
