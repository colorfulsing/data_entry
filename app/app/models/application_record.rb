class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  SEARCH_JOIN_TOKEN = ':'

  class << self
    def entity_label
      self.name.titleize
    end
  end
end
