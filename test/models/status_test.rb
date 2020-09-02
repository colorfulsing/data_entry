require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save with valid values" do
    status = Status.new nombre: 'Prueba', visible: true
    assert status.save
    status.delete
  end

  test "should not save without nombre" do
    status = Status.new visible: true
    assert_not status.save
    status.delete
  end

  test "should not save without visible" do
    status = Status.new nombre: 'Prueba'
    assert_not status.save
    status.delete
  end
end
