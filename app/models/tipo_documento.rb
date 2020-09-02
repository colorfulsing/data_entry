class TipoDocumento < ApplicationRecord
  self.table_name = 'tipo_documento'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_documento', inverse_of: :tipo_documento

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
