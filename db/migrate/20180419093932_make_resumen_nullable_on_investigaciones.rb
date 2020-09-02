class MakeResumenNullableOnInvestigaciones < ActiveRecord::Migration[5.1]
  def change
    change_column :investigaciones, :resumen, :string, null: true, limit: 2000
  end
end
