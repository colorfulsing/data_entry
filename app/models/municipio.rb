class Municipio < ApplicationRecord
  self.table_name = 'municipios'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :departamento, class_name: 'Departamento', foreign_key: 'id_departamento', inverse_of: :municipios
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_municipio', inverse_of: :municipio

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
      results = results.where(departamento: parent) if !parent.blank?
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:status, :departamento)
        .order(:nombre)
    end
  end
end
