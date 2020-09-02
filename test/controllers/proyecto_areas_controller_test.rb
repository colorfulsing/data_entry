require 'test_helper'

class ProyectoAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proyecto_area = proyecto_areas(:one)
  end

  test "should get index" do
    get proyecto_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_proyecto_area_url
    assert_response :success
  end

  test "should create proyecto_area" do
    assert_difference('ProyectoArea.count') do
      post proyecto_areas_url, params: { proyecto_area: { id_area: @proyecto_area.id_area, id_proyecto: @proyecto_area.id_proyecto } }
    end

    assert_redirected_to proyecto_area_url(ProyectoArea.last)
  end

  test "should show proyecto_area" do
    get proyecto_area_url(@proyecto_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_proyecto_area_url(@proyecto_area)
    assert_response :success
  end

  test "should update proyecto_area" do
    patch proyecto_area_url(@proyecto_area), params: { proyecto_area: { id_area: @proyecto_area.id_area, id_proyecto: @proyecto_area.id_proyecto } }
    assert_redirected_to proyecto_area_url(@proyecto_area)
  end

  test "should destroy proyecto_area" do
    assert_difference('ProyectoArea.count', -1) do
      delete proyecto_area_url(@proyecto_area)
    end

    assert_redirected_to proyecto_areas_url
  end
end
