class Status < ApplicationRecord
  self.table_name = 'status'

  VALUES = {
    :active => 1,
    :inactive => 2,
    :deleted => 3
    #:published => 4
  }

  def deleted?
    self.id == VALUES[:deleted]
  end

  def visible?
    self.visible == 1
  end
end
