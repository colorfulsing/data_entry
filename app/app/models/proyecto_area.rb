class ProyectoArea < ApplicationRecord
  self.table_name = 'proyecto_area'

  validates :id_area, presence: true
  validates :id_proyecto, presence: true
end
