class Status < ApplicationRecord
  self.table_name = 'status'

  validates :nombre, presence: true
  validates :visible, presence: true

  has_many :areas, class_name: 'Area', foreign_key: 'id_status', inverse_of: :status
  has_many :cuencas, class_name: 'Cuenca', foreign_key: 'id_status', inverse_of: :status
  has_many :departamentos, class_name: 'Departamento', foreign_key: 'id_status', inverse_of: :status
  has_many :facultades, class_name: 'Facultad', foreign_key: 'id_status', inverse_of: :status
  has_many :instituciones, class_name: 'Institucion', foreign_key: 'id_status', inverse_of: :status
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_status', inverse_of: :status
  has_many :microcuencas, class_name: 'Microcuenca', foreign_key: 'id_status', inverse_of: :status
  has_many :municipios, class_name: 'Municipio', foreign_key: 'id_status', inverse_of: :status
  has_many :proyectos, class_name: 'Proyecto', foreign_key: 'id_status', inverse_of: :status
  has_many :subcuencas, class_name: 'Subcuenca', foreign_key: 'id_status', inverse_of: :status
  has_many :tipo_documentos, class_name: 'TipoDocumento', foreign_key: 'id_status', inverse_of: :status
  has_many :users, class_name: 'User', foreign_key: 'id_status', inverse_of: :status
  has_many :vertientes, class_name: 'Vertiente', foreign_key: 'id_status', inverse_of: :status

  VALUES = {
    :active => 1,
    :inactive => 2,
    :deleted => 3
    #:published => 4
  }

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      results = self.all
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.order(:nombre)
    end

    def entity_label
      "Estado"
    end
  end

  def is_used?
    (areas.count > 0 ||
      cuencas.count > 0 ||
      departamentos.count > 0 ||
      facultades.count > 0 ||
      instituciones.count > 0 ||
      investigaciones.count > 0 ||
      microcuencas.count > 0 ||
      municipios.count > 0 ||
      proyectos.count > 0 ||
      subcuencas.count > 0 ||
      tipo_documentos.count > 0 ||
      users.count > 0 ||
      vertientes.count > 0)
  end

  def can_be_deleted?
    !(VALUES.values.includes?(self.id) || self.is_used?)
  end

  def deleted?
    self.id == VALUES[:deleted]
  end

  def inactive?
    self.id == VALUES[:inactive]
  end

  def active?
    self.id == VALUES[:active]
  end

  def visible?
    self.visible == 1
  end
end
