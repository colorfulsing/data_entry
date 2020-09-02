require 'test_helper'

class DefaultControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    sign_in users(:user)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get home" do
    get home_url
    assert_response :success
  end

  test "should get empty search" do
    get search_url
    assert_response :success
  end

  test "should get search" do
    get search_url, params: {q: 'Agua', search_type: 'Area,Cuenca,Departamento,Facultad,Institucion,Investigacion,Microcuenca,Municipio,Proyecto,Status,Subcuenca,TipoDocumento,TipoInstituto,Vertiente'}
    assert_response :success
  end

end
