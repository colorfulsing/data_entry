class IncreaseResumeField < ActiveRecord::Migration[5.1]
  def change
    change_column :investigaciones, :resumen, :text, limit: 65500
  end
end
