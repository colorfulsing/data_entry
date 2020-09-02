class MakeDescriptionNullableOnTipoDocumento < ActiveRecord::Migration[5.1]
  def change
    change_column :tipo_documento, :descripcion, :string, null: true, limit: 500
  end
end
