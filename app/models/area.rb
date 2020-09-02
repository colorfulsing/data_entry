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
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      results = self.all
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:proyectos, :investigaciones, :status)
        .order(:nombre)
    end
  end
end
