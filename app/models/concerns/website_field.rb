module WebsiteField
  extend ActiveSupport::Concern

  included do
    def website_valid?
      self.website =~ /^\s*http/i
    end
  end

  module ClassMethods
  end
end
