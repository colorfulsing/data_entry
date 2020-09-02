require 'test_helper'

class AreaInvestigacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_investigacion = area_investigacions(:one)
  end

  test "should get index" do
    get area_investigacions_url
    assert_response :success
  end

  test "should get new" do
    get new_area_investigacion_url
    assert_response :success
  end

  test "should create area_investigacion" do
    assert_difference('AreaInvestigacion.count') do
      post area_investigacions_url, params: { area_investigacion: { id_area: @area_investigacion.id_area, id_investigacion: @area_investigacion.id_investigacion } }
    end

    assert_redirected_to area_investigacion_url(AreaInvestigacion.last)
  end

  test "should show area_investigacion" do
    get area_investigacion_url(@area_investigacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_investigacion_url(@area_investigacion)
    assert_response :success
  end

  test "should update area_investigacion" do
    patch area_investigacion_url(@area_investigacion), params: { area_investigacion: { id_area: @area_investigacion.id_area, id_investigacion: @area_investigacion.id_investigacion } }
    assert_redirected_to area_investigacion_url(@area_investigacion)
  end

  test "should destroy area_investigacion" do
    assert_difference('AreaInvestigacion.count', -1) do
      delete area_investigacion_url(@area_investigacion)
    end

    assert_redirected_to area_investigacions_url
  end
end
