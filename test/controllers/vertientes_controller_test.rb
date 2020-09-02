require 'test_helper'

class VertientesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @vertiente = vertientes(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get vertientes_url
    assert_response :success
  end

  test "should get new" do
    get new_vertiente_url
    assert_response :success
  end

  test "should create vertiente" do
    assert_difference('Vertiente.count') do
      post vertientes_url, params: { vertiente: { id_status: @vertiente.id_status, nombre: @vertiente.nombre } }
    end

    assert_redirected_to vertiente_url(Vertiente.last)
  end

  test "should show vertiente" do
    get vertiente_url(@vertiente)
    assert_response :success
  end

  test "should get edit" do
    get edit_vertiente_url(@vertiente)
    assert_response :success
  end

  test "should update vertiente" do
    patch vertiente_url(@vertiente), params: { vertiente: { id_status: @vertiente.id_status, nombre: @vertiente.nombre } }
    assert_redirected_to vertiente_url(@vertiente)
  end

  test "should destroy vertiente" do
    assert_no_difference('Vertiente.count') do
      delete vertiente_url(@vertiente)
    end
    @vertiente.reload
    assert @vertiente.status.deleted?

    assert_redirected_to vertientes_url
  end
end
