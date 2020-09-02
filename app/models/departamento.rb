class Departamento < ApplicationRecord
  self.table_name = "departamentos"

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :municipios, class_name: 'Municpio', foreign_key: 'id_departamento', inverse_of: :departamento
end
