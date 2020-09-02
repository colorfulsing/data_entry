require 'test_helper'

class DepartamentoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    subject = Departamento.new nombre: 'Prueba', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    subject = Departamento.new status: status
    assert_not subject.save
  end

  test "should not save without status" do
    vertiente = vertientes(:one)
    subject = Departamento.new nombre: 'Prueba'
    assert_not subject.save
  end
end
