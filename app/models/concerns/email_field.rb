module EmailField
  extend ActiveSupport::Concern

  included do
    def email_valid?
      self.email =~ /@/i
    end
  end

  module ClassMethods
  end
end
