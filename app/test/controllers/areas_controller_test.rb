require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @area = areas(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get areas_url
    assert_response :success
  end

  test "should get new" do
    get new_area_url
    assert_response :success
  end

  test "should create area" do
    assert_difference('Area.count') do
      post areas_url, params: { area: { descripcion: @area.descripcion, id_status: @area.status.id, nombre: @area.nombre } }
    end

    assert_redirected_to area_url(Area.last)
  end

  test "should show area" do
    get area_url(@area)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_url(@area)
    assert_response :success
  end

  test "should update area" do
    patch area_url(@area), params: { area: { descripcion: @area.descripcion, id_status: @area.status.id, nombre: @area.nombre } }
    assert_redirected_to area_url(@area)
  end

  test "should destroy area" do
    assert_no_difference('Area.count') do
      delete area_url(@area)
    end
    @area.reload
    assert @area.status.deleted?

    assert_redirected_to areas_url
  end
end
