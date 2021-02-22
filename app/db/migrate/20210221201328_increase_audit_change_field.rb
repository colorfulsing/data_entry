class IncreaseAuditChangeField < ActiveRecord::Migration[5.1]
  def change
    change_column :audits, :change, :longtext
  end
end
