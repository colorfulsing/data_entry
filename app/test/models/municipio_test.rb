require 'test_helper'

class MunicipioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    departamento = departamentos(:one)
    subject = Municipio.new departamento: departamento, nombre: 'Prueba', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    departamento = departamentos(:one)
    subject = Municipio.new departamento: departamento, status: status
    assert_not subject.save
  end

  test "should not save without status" do
    departamento = departamentos(:one)
    subject = Municipio.new departamento: departamento, nombre: 'Prueba'
    assert_not subject.save
  end

  test "should save without departamento" do
    status = statuses(:active)
    subject = Municipio.new nombre: 'Prueba', status: status
    assert_not subject.save
  end
end
