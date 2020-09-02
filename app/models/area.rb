class Area < ApplicationRecord
  self.table_name = 'area'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_and_belongs_to_many :proyectos,
    class_name: "Proyecto",
    foreign_key: "id_area",
    association_foreign_key: "id_proyecto",
    join_table: 'proyecto_area',
    inverse_of: :areas
  has_and_belongs_to_many :investigaciones,
    class_name: "Investigacion",
    foreign_key: "id_area",
    association_foreign_key: "id_investigacion",
    join_table: 'area_investigacion',
    inverse_of: :areas

  class << self
    def search query
      where("nombre RLIKE ?", [query])
        .includes(:proyectos, :investigaciones, :status)
    end
  end
end
