class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def entity_label
      self.name.titleize
    end
  end
end
