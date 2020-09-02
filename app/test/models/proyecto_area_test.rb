require 'test_helper'

class ProyectoAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    proyecto = proyectos(:one)
    area = areas(:one)
    subject = ProyectoArea.new id_proyecto: proyecto.id, id_area: area.id
    assert subject.save
  end

  test "should not save without area" do
    proyecto = proyectos(:one)
    subject = ProyectoArea.new id_proyecto: proyecto.id
    assert_not subject.save
  end

  test "should not save without proyect" do
    area = areas(:one)
    subject = ProyectoArea.new id_area: area.id
    assert_not subject.save
  end
end
