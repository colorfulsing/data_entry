class CreateAudits < ActiveRecord::Migration[5.2]
  def change
    create_table :audits do |t|
      t.references :target, polymorphic: true, null: false
      t.text :change, null: false
      t.string :commit_hash, null: false, limit: 50
      t.references :user, polymorphic: true, null: false
      t.integer :id_status, null: false
      t.string :action, null: false, limit: 100

      t.timestamps null: false

      t.index [:user_id, :user_type, :target_id, :target_type, :created_at, :updated_at, :action], name: :audits_main_idx
    end

    add_foreign_key :audits, :status, column: :id_status, name: :audit_status
  end
end
