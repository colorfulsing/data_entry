class AddMissingColumnsToTipoInstituto < ActiveRecord::Migration[5.1]
  def change
    add_column :tipo_instituto, :descripcion, :string, limit: 300
    add_column :tipo_instituto, :id_status, :int
    add_column :tipo_instituto, :updated_at, :datetime
    add_column :tipo_instituto, :created_at, :datetime
  end
end
