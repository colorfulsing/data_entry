class AddMissingStatusFk < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :tipo_instituto, :status, column: :id_status, name: :tipo_instituto_status
    add_foreign_key :users, :status, column: :id_status, name: :users_status
  end
end
