module Auditable
  extend ActiveSupport::Concern

  included do
    #after_create :track_changes
    after_save :track_changes
    after_destroy :track_delete

    protected
      def track_changes opts = {}
        return if Audit.current_commit_hash.nil?
        Audit.track_change self, opts
      end

      def track_delete
        self.track_changes action: 'delete'
      end
  end

  module ClassMethods
  end
end
