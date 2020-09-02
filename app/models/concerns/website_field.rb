module WebsiteField
  extend ActiveSupport::Concern

  included do
    #validate :website_validation

    def website_valid?
      return true if self.website.blank?
      url = URI.parse(self.website) rescue false
      url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
    end

    protected
      def website_validation
        if !self.website_valid?
          self.errors.add(:website, 'no tiene un formato valido.')
        end
      end
  end

  module ClassMethods
  end
end
