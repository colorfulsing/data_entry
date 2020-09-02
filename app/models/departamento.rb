class Departamento < ApplicationRecord
  self.table_name = "departamentos"

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :municipios, class_name: 'Municipio', foreign_key: 'id_departamento', inverse_of: :departamento

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:status)
    end
  end
end
