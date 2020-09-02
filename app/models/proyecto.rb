class Proyecto < ApplicationRecord
  self.table_name = 'proyecto_programa'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :facultad, class_name: 'Facultad', foreign_key: 'id_insituto', inverse_of: :proyectos
  has_and_belongs_to_many :areas,
      class_name: "Area",
      foreign_key: "id_proyecto",
      association_foreign_key: "id_area",
      join_table: 'proyecto_area',
      inverse_of: :proyectos
end
