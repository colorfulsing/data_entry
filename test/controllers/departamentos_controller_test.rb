require 'test_helper'

class DepartamentosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @departamento = departamentos(:one)
    sign_in users(:admin)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get departamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_departamento_url
    assert_response :success
  end

  test "should create departamento" do
    assert_difference('Departamento.count') do
      post departamentos_url, params: { departamento: { id_status: @departamento.id_status, nombre: @departamento.nombre } }
    end

    assert_redirected_to departamento_url(Departamento.last)
  end

  test "should show departamento" do
    get departamento_url(@departamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_departamento_url(@departamento)
    assert_response :success
  end

  test "should update departamento" do
    patch departamento_url(@departamento), params: { departamento: { id_status: @departamento.id_status, nombre: @departamento.nombre } }
    assert_redirected_to departamento_url(@departamento)
  end

  test "should destroy departamento" do
    assert_no_difference('Departamento.count') do
      delete departamento_url(@departamento)
    end
    @departamento.reload
    assert @departamento.status.deleted?

    assert_redirected_to departamentos_url
  end
end
