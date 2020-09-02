class AddIdStatusToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :id_status, :int
  end
end
