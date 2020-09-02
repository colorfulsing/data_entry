require 'test_helper'

class MicrocuencaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    subcuenca = subcuencas(:one)
    subject = Microcuenca.new subcuenca: subcuenca, nombre: 'Prueba', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    subcuenca = subcuencas(:one)
    subject = Microcuenca.new subcuenca: subcuenca, status: status
    assert_not subject.save
  end

  test "should not save without status" do
    subcuenca = subcuencas(:one)
    subject = Microcuenca.new subcuenca: subcuenca, nombre: 'Prueba'
    assert_not subject.save
  end

  test "should save without subcuenca" do
    status = statuses(:active)
    subject = Microcuenca.new nombre: 'Prueba', status: status
    assert_not subject.save
  end
end
