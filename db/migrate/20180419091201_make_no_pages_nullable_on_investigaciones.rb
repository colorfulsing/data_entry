class MakeNoPagesNullableOnInvestigaciones < ActiveRecord::Migration[5.1]
  def change
    change_column :investigaciones, :no_paginas, :int, null: true
  end
end
