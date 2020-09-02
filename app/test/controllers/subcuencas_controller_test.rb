require 'test_helper'

class SubcuencasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @subcuenca = subcuencas(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
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
    assert_no_difference('Subcuenca.count') do
      delete subcuenca_url(@subcuenca)
    end
    @subcuenca.reload
    assert @subcuenca.status.deleted?

    assert_redirected_to subcuencas_url
  end
end
