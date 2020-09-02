class MakeDescriptionNullableOnTipoInstituto < ActiveRecord::Migration[5.1]
  def change
    change_column :tipo_instituto, :descripcion, :string, null: true, limit: 500
  end
end
