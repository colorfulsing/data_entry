require 'test_helper'

class SubcuencaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    cuenca = cuencas(:one)
    subject = Subcuenca.new cuenca: cuenca, nombre: 'Prueba', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    cuenca = cuencas(:one)
    subject = Subcuenca.new cuenca: cuenca, status: status
    assert_not subject.save
  end

  test "should not save without status" do
    cuenca = cuencas(:one)
    subject = Subcuenca.new cuenca: cuenca, nombre: 'Prueba'
    assert_not subject.save
  end

  test "should save without cuenca" do
    status = statuses(:active)
    subject = Subcuenca.new nombre: 'Prueba', status: status
    assert_not subject.save
  end
end
