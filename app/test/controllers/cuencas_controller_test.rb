require 'test_helper'

class CuencasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @cuenca = cuencas(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
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
      post cuencas_url, params: { cuenca: { id_status: @cuenca.status.id, id_vertiente: @cuenca.vertiente.id, nombre: @cuenca.nombre } }
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
    patch cuenca_url(@cuenca), params: { cuenca: { id_status: @cuenca.status.id, id_vertiente: @cuenca.vertiente.id, nombre: @cuenca.nombre } }
    assert_redirected_to cuenca_url(@cuenca)
  end

  test "should destroy cuenca" do
    assert_no_difference('Cuenca.count') do
      delete cuenca_url(@cuenca)
    end
    @cuenca.reload
    assert @cuenca.status.deleted?

    assert_redirected_to cuencas_url
  end
end
