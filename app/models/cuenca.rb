class Cuenca < ApplicationRecord
  self.table_name = "cuencas"

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :vertiente, class_name: 'Vertiente', foreign_key: 'id_vertiente', inverse_of: :cuencas
  has_many :subcuencas, class_name: 'Subcuenca', foreign_key: 'id_cuenca', inverse_of: :cuenca

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:vertiente, :status)
    end
  end
end
