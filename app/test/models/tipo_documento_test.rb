require 'test_helper'

class TipoDocumentoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = statuses(:active)
    subject = TipoDocumento.new nombre: 'Prueba', descripcion: 'Descripcion', status: status
    assert subject.save
  end

  test "should not save without nombre" do
    status = statuses(:active)
    subject = TipoDocumento.new descripcion: 'Descripcion', status: status
    assert_not subject.save
  end

  test "should not save without status" do
    subject = TipoDocumento.new nombre: 'Prueba', descripcion: 'Descripcion'
    assert_not subject.save
  end

  test "should save without descripcion" do
    status = statuses(:active)
    subject = TipoDocumento.new nombre: 'Prueba', status: status
    assert subject.save
  end
end
