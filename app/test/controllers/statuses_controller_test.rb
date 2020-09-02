require 'test_helper'

class StatusesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  setup do
    @status = statuses(:one)
    sign_in users(:admin)
  end

  teardown do
    Warden.test_reset!
  end

  test "should get index" do
    get statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_status_url
    assert_response :success
  end

  test "should create status" do
    assert_difference('Status.count') do
      post statuses_url, params: { status: { nombre: @status.nombre, visible: @status.visible } }
    end

    assert_redirected_to status_url(Status.last)
  end

  test "should show status" do
    get status_url(@status)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_url(@status)
    assert_response :success
  end

  test "should update status" do
    patch status_url(@status), params: { status: { nombre: @status.nombre, visible: @status.visible } }
    assert_redirected_to status_url(@status)
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete status_url(@status)
    end

    assert_redirected_to statuses_url
  end
end
