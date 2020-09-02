class RemoveStatusDefaultValues < ActiveRecord::Migration[5.1]
  def change
    change_column_default :area, :id_status, nil
    change_column_default :cuencas, :id_status, nil
    change_column_default :departamentos, :id_status, nil
    change_column_default :facultades_institutos, :id_status, nil
    change_column_default :investigaciones, :id_status, nil
    change_column_default :microcuenca, :id_status, nil
    change_column_default :municipios, :id_status, nil
    change_column_default :proyecto_programa, :id_status, nil
    change_column_default :subcuencas, :id_status, nil
    change_column_default :tipo_documento, :id_status, nil
    change_column_default :tipo_instituto, :id_status, nil
    change_column_default :vertientes, :id_status, nil
    change_column_default :users, :id_status, nil
  end
end
