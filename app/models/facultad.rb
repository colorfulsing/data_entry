class Facultad < ApplicationRecord
  self.table_name = "facultades_institutos"

  include EmailField
  include WebsiteField

  alias_attribute :email, :correo_electronico
  alias_attribute :website, :sitio_web

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :institucion, class_name: 'Institucion', foreign_key: 'id_instituciones', inverse_of: :facultades
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_instituto', inverse_of: :facultad
  has_many :proyectos, class_name: 'Proyecto', foreign_key: 'id_instituto', inverse_of: :facultad
end
