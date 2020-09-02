require 'test_helper'

class AuditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @status_active = statuses(:active)
    @status_reverted = statuses(:inactive)
    @status_deleted = statuses(:deleted)
    @user = users(:user)
    Audit.current_user = @user
  end

  test "should refresh commit hash" do
    Audit::current_commit_hash = nil
    assert_nil Audit::current_commit_hash
    Audit::refresh_commit_hash
    old_commit_hash = Audit::refresh_commit_hash
    assert_not_nil old_commit_hash
    Audit::refresh_commit_hash
    new_commit_hash = Audit::refresh_commit_hash
    assert_not_equal old_commit_hash, new_commit_hash
  end

  test "should track a create a new status" do
    Audit::refresh_commit_hash
    assert_equal 0, Audit.from_current_commit.count
    status = Status.create nombre: 'Prueba', visible: true
    assert_equal 1, Audit.from_current_commit.count
    assert_equal 'create', Audit.from_current_commit.first['action']
  end

  test "should track changes on an existing status" do
    Audit::current_commit_hash = nil
    status = Status.create nombre: 'Prueba', visible: true
    Audit.refresh_commit_hash
    assert_equal 0, Audit.from_current_commit.count
    status.nombre = "Prueba2"
    assert status.save
    assert_equal 1, Audit.from_current_commit.count
    assert_equal 'update', Audit.from_current_commit.first['action']
  end

  test "should track delete an existing status" do
    Audit::current_commit_hash = nil
    status = Status.create nombre: 'Prueba', visible: true
    Audit.refresh_commit_hash
    assert_equal 0, Audit.from_current_commit.count
    status.destroy
    assert_equal 1, Audit.from_current_commit.count
    assert_equal 'delete', Audit.from_current_commit.first['action']
  end
end
