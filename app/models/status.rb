class Status < ApplicationRecord
  self.table_name = 'status'

  VALUES = {
    :active => 1,
    :inactive => 2,
    :deleted => 3
    #:published => 4
  }

  class << self
    def search query
      where("nombre RLIKE ?", [query])
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
