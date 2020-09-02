class Cuenca < ApplicationRecord
  self.table_name = "cuencas"

  include Auditable

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  belongs_to :vertiente, class_name: 'Vertiente', foreign_key: 'id_vertiente', inverse_of: :cuencas
  has_many :subcuencas, class_name: 'Subcuenca', foreign_key: 'id_cuenca', inverse_of: :cuenca

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
      results = results.where(vertiente: parent) if !parent.blank?
      results = results.where("nombre RLIKE ?", [query]) if !query.blank?
      results.includes(:vertiente, :status)
        .order(:nombre)
    end
  end
end
