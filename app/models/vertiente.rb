class Vertiente < ApplicationRecord
  self.table_name = 'vertientes'

  belongs_to :status, class_name: 'Status', foreign_key: 'id_status'
  has_many :cuencas, class_name: 'Cuenca', foreign_key: 'id_vertiente', inverse_of: :vertiente

  validates :nombre, presence: true
  validates :status, presence: true

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
