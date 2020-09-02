class Proyecto < ApplicationRecord
  self.table_name = 'proyecto_programa'

  include Auditable

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :facultad, class_name: 'Facultad', foreign_key: 'id_instituto', inverse_of: :proyectos
  has_and_belongs_to_many :areas,
      class_name: "Area",
      foreign_key: "id_proyecto",
      association_foreign_key: "id_area",
      join_table: 'proyecto_area',
      inverse_of: :proyectos

  validates :nombre, presence: true
  validates :status, presence: true

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      parent = opts.delete(:parent)
      results = self.all
      results = results.where(facultad: parent) if !parent.blank?
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:status, :facultad)
        .order(:nombre)
    end
  end
end
