require 'test_helper'

class TipoInstitutosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @tipo_instituto = tipo_institutos(:one)
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get tipo_institutos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_instituto_url
    assert_response :success
  end

  test "should create tipo_instituto" do
    assert_difference('TipoInstituto.count') do
      post tipo_institutos_url, params: { tipo_instituto: { descripcion: @tipo_instituto.descripcion, id_status: @tipo_instituto.id_status, nombre: @tipo_instituto.nombre } }
    end

    assert_redirected_to tipo_instituto_url(TipoInstituto.last)
  end

  test "should show tipo_instituto" do
    get tipo_instituto_url(@tipo_instituto)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_instituto_url(@tipo_instituto)
    assert_response :success
  end

  test "should update tipo_instituto" do
    patch tipo_instituto_url(@tipo_instituto), params: { tipo_instituto: { descripcion: @tipo_instituto.descripcion, id_status: @tipo_instituto.id_status, nombre: @tipo_instituto.nombre } }
    assert_redirected_to tipo_instituto_url(@tipo_instituto)
  end

  test "should destroy tipo_instituto" do
    assert_no_difference('TipoInstituto.count') do
      delete tipo_instituto_url(@tipo_instituto)
    end
    @tipo_instituto.reload
    assert @tipo_instituto.status.deleted?

    assert_redirected_to tipo_institutos_url
  end
end
