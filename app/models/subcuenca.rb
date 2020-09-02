class Subcuenca < ApplicationRecord
  self.table_name = 'subcuencas'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :cuenca, class_name: 'Cuenca', foreign_key: 'id_cuenca', inverse_of: :subcuencas
  has_many :microcuencas, class_name: 'Microcuenca', foreign_key: 'id_subcuenca', inverse_of: :subcuenca

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:status, :cuenca)
    end
  end
end
