class Facultad < ApplicationRecord
  self.table_name = "facultades_institutos"

  include EmailField
  include WebsiteField

  alias_attribute :email, :correo_electronico
  alias_attribute :website, :sitio_web
  alias_attribute :id_institucion, :id_instituciones

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :institucion, class_name: 'Institucion', foreign_key: 'id_instituciones', inverse_of: :facultades
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_instituto', inverse_of: :facultad
  has_many :proyectos, class_name: 'Proyecto', foreign_key: 'id_instituto', inverse_of: :facultad

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      parent = opts.delete(:parent)
      results = self.all
      results = results.where(institucion: parent) if !parent.blank?
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:institucion, :status)
        .order(:nombre)
    end
  end
end
