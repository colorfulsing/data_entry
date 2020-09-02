class Audit < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user, polymorphic: true
  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'

  class << self
    def current_user
      RequestStore.store[:current_user] || nil
    end

    def current_user=(user)
      RequestStore.store[:current_user] = user
    end

    def refresh_commit_hash
      self::current_commit_hash = SecureRandom.hex(20)
      self::current_commit_hash
    end

    def current_commit_hash
      RequestStore.store[:commit_hash] || nil
    end

    def current_commit_hash=(commit_hash)
      RequestStore.store[:commit_hash] = commit_hash
    end

    def from_commit commit_hash
      where commit_hash: commit_hash
    end

    def from_current_commit
      self::from_commit self::current_commit_hash
    end

    def deduce_action previous_changes
      (previous_changes.has_key?(:id) && previous_changes['id'].try(:[], 0).nil?) ?
        'create' : 'update'
    end

    def track_change_list item_list, opts = {}
      raise ArgumentException.new "Item list cann't be null" if item_list.nil?

      # Track changes
      item_list = [item_list] unless item_list.is_a? Enumerable
      user = opts.delete(:user) || self::current_user
      commit_hash = opts.delete(:commit_hash) || self::current_commit_hash
      action = opts.delete(:action) || nil
      item_list.each do |item|
        previous_changes = item.previous_changes
        action ||= self::deduce_action previous_changes
        Audit::create target: item,
          change: previous_changes,
          action: action,
          user: user,
          commit_hash: commit_hash,
          status: Status.find(Status::VALUES[:active])
      end
      commit_hash
    end

    def track_change item, opts = {}
      track_change_list [item], opts
    end

    def rever_change commit_hash
      # TODO: Implement a revert change functionality and make sure to track
      #   the revert as a change itself so it can be undone if needed.
      raise NotImplemented.new
    end
  end
end
