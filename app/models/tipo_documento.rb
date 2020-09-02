class TipoDocumento < ApplicationRecord
  self.table_name = 'tipo_documento'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_documento', inverse_of: :tipo_documento
end
