require 'test_helper'

class CuencaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    vertiente = vertientes(:one)
    subject = Cuenca.new vertiente: vertiente, nombre: 'Prueba', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    vertiente = vertientes(:one)
    subject = Cuenca.new vertiente: vertiente, status: status
    assert_not subject.save
  end

  test "should not save without status" do
    vertiente = vertientes(:one)
    subject = Cuenca.new vertiente: vertiente, nombre: 'Prueba'
    assert_not subject.save
  end

  test "should save without vertiente" do
    status = statuses(:active)
    subject = Cuenca.new nombre: 'Prueba', status: status
    assert_not subject.save
  end
end
