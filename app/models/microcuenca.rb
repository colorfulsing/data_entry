class Microcuenca < ApplicationRecord
  self.table_name = 'microcuenca'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :subcuenca, class_name: 'Subcuenca', foreign_key: 'id_subcuenca', inverse_of: :microcuencas
  has_many :investigaciones, class_name: 'Investigacion', foreign_key: 'id_microcuenca', inverse_of: :microcuenca

  class << self
    def search_entity_class parent = nil
      value = self.name
      value = "#{value}#{self::SEARCH_JOIN_TOKEN}#{parent}" if !parent.blank?
      value
    end

    def search query, opts = {}
      parent = opts.delete(:parent)
      results = self
      results = where(subcuenca: parent) if !parent.blank?
      results.where("nombre RLIKE ?", [query])
        .includes(:status, :subcuenca)
        .order(:nombre)
    end
  end
end
