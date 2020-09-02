class Departamento < ApplicationRecord
  self.table_name = "departamentos"

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :municipios, class_name: 'Municipio', foreign_key: 'id_departamento', inverse_of: :departamento

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query, opts = {}
      where("nombre RLIKE ?", [query])
        .includes(:status)
        .order(:nombre)
    end
  end
end
