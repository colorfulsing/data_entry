class Subcuenca < ApplicationRecord
  self.table_name = 'subcuencas'

  include Auditable

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :cuenca, class_name: 'Cuenca', foreign_key: 'id_cuenca', inverse_of: :subcuencas
  has_many :microcuencas, class_name: 'Microcuenca', foreign_key: 'id_subcuenca', inverse_of: :subcuenca

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
      results = results.where(cuenca: parent) if !parent.blank?
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:status, :cuenca)
        .order(:nombre)
    end
  end
end
