require 'test_helper'

class AreaInvestigacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    investigacion = investigacions(:one)
    area = areas(:one)
    subject = AreaInvestigacion.new id_investigacion: investigacion.id, id_area: area.id
    assert subject.save
  end

  test "should not save without area" do
    investigacion = investigacions(:one)
    subject = AreaInvestigacion.new id_investigacion: investigacion.id
    assert_not subject.save
  end

  test "should not save without investigacion" do
    area = areas(:one)
    subject = AreaInvestigacion.new id_area: area.id
    assert_not subject.save
  end
end
