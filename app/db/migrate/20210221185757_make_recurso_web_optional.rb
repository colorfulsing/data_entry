class MakeRecursoWebOptional < ActiveRecord::Migration[5.1]
  def change
    change_column :investigaciones, :recurso_web, :text, null: true
  end
end
