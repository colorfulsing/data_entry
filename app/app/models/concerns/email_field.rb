module EmailField
  extend ActiveSupport::Concern

  included do
    #validate :email_validation

    def email_valid?
      self.email.blank? || self.email =~ Devise.email_regexp
    end

    protected
      def email_validation
        if !self.email_valid?
          self.errors.add(:email, "formato invalido.")
        end
      end

  end

  module ClassMethods
  end
end
