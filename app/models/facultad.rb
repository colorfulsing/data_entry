class Facultad < ApplicationRecord
  self.table_name = "facultades_institutos"

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :institucion, class_name: 'Institucion', foreign_key: 'id_instituciones', inverse_of: :facultades
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_instituto', inverse_of: :facultad
  has_many :proyectos, class_name: 'Proyecto', foreign_key: 'id_instituto', inverse_of: :facultad

  def sitio_web_valid?
    self.sitio_web =~ /^\s*http/i
  end

  def correo_electronico_valid?
    self.correo_electronico =~ /@/i
  end
end
