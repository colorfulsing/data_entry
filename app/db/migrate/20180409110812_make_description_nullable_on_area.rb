class MakeDescriptionNullableOnArea < ActiveRecord::Migration[5.1]
  def change
    change_column :area, :descripcion, :string, null: true, limit: 500
  end
end
