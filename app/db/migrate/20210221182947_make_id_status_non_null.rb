class MakeIdStatusNonNull < ActiveRecord::Migration[5.1]
  def change
    change_column :subcuencas, :id_status, :int, null: false
    change_column :cuencas, :id_status, :int, null: false
    change_column :vertientes, :id_status, :int, null: false
    change_column :microcuenca, :id_status, :int, null: false
    change_column :investigaciones, :id_status, :int, null: false
    change_column :tipo_documento, :id_status, :int, null: false
    change_column :municipios, :id_status, :int, null: false
    change_column :departamentos, :id_status, :int, null: false
    change_column :instituciones, :id_status, :int, null: false
    change_column :area, :id_status, :int, null: false
    change_column :proyecto_programa, :id_status, :int, null: false
    change_column :facultades_institutos, :id_status, :int, null: false
    change_column :tipo_instituto, :id_status, :int, null: false
    change_column :users, :id_status, :int, null: false
  end
end
