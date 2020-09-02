class Microcuenca < ApplicationRecord
  self.table_name = 'microcuenca'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :subcuenca, class_name: 'Subcuenca', foreign_key: 'id_subcuenca', inverse_of: :microcuencas
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_microcuenca', inverse_of: :microcuenca

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:status, :subcuenca)
    end
  end
end
