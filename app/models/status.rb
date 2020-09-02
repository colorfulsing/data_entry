class Status < ApplicationRecord
  self.table_name = 'status'

  VALUES = {
    :active => 1,
    :inactive => 2,
    :deleted => 3
    #:published => 4
  }

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      results = self.all
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.order(:nombre)
    end

    def entity_label
      "Estado"
    end
  end

  def deleted?
    self.id == VALUES[:deleted]
  end

  def visible?
    self.visible == 1
  end
end
