class Institucion < ApplicationRecord
  self.table_name = 'instituciones'

  include EmailField
  include WebsiteField

  alias_attribute :email, :correo_electronico
  alias_attribute :website, :sitio_web

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :facultades, class_name: 'Facultad', foreign_key: 'id_instituciones', inverse_of: :institucion
  has_many :proyectos, :through => :facultades
  has_many :investigaciones, :through => :facultades #do
  #  def active
  #    where(['facultades_institutos.status = ?', Status::VALUES[:active]]).
  #    where(['investigaciones.status >= ?',   Status::VALUES[:active]])
  #  end
  #end

  validates :nombre, presence: true
  validates :status, presence: true
  validates :direccion, presence: true

  #alias_attribute :institutos, :facultades

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query = nil, opts = {}
      results = self.all
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:status)
        .order(:nombre)
    end
  end
end
