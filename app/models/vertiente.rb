class Vertiente < ApplicationRecord
  self.table_name = 'vertientes'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :cuencas, class_name: 'Cuenca', foreign_key: 'id_vertiente', inverse_of: :vertiente

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:status)
    end
  end
end
