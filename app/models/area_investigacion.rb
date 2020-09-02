class AreaInvestigacion < ApplicationRecord
  self.table_name = "area_investigacion"

  validates :id_area, presence: true
  validates :id_investigacion, presence: true
end
