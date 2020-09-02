class Institucion < ApplicationRecord
  self.table_name = 'instituciones'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :facultades, class_name: 'Facultad', foreign_key: 'id_instituciones', inverse_of: :institucion
  has_many :proyectos, :through => :facultades
  has_many :investigaciones, :through => :facultades #do
  #  def active
  #    where(['facultades_institutos.status = ?', Status::VALUES[:active]]).
  #    where(['investigaciones.status >= ?',   Status::VALUES[:active]])
  #  end
  #end

  #alias_attribute :institutos, :facultades

  def sitio_web_valid?
    self.sitio_web =~ /^\s*http/i
  end

  def correo_electronico_valid?
    self.correo_electronico =~ /@/i
  end
end
