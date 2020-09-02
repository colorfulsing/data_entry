class Municipio < ApplicationRecord
  self.table_name = 'municipios'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :departamento, class_name: 'Departamento', foreign_key: 'id_departamento', inverse_of: :municipios
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_municipio', inverse_of: :municipio

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:status, :departamento)
    end
  end
end
