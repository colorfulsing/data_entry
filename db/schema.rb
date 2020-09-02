# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180409115628) do

  create_table "area", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.string "descripcion", limit: 500
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "area_created_at"
    t.index ["id_status"], name: "area_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "area_investigacion", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_investigacion", null: false
    t.integer "id_area", null: false
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_area"], name: "fk13_idx"
    t.index ["id_investigacion"], name: "fk14_idx"
  end

  create_table "cuencas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_vertiente", null: false
    t.string "nombre", limit: 100, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "cuencas_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_status"], name: "cuencas_status_idx"
    t.index ["id_vertiente"], name: "fk7_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "departamentos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 45, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "departamentos_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_status"], name: "departamentos_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "facultades_institutos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_instituciones", null: false
    t.integer "id_tipo_instituto", default: 1, null: false
    t.string "nombre", limit: 150, null: false
    t.string "siglas", limit: 30, default: "N/A"
    t.string "telefono", limit: 30, default: "Mismo de la institución"
    t.string "extension", limit: 45, default: "N/A"
    t.string "direccion", limit: 300, default: "Dentro de la institución"
    t.string "correo_electronico", limit: 60, default: "Mismo de la institución"
    t.string "sitio_web", limit: 150, default: "Mismo de la institución"
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "facultades_institutos_created_at"
    t.index ["id_instituciones"], name: "fk1_idx"
    t.index ["id_status"], name: "facultades_institutos_status_idx"
    t.index ["id_tipo_instituto"], name: "fk123_idx"
  end

  create_table "instituciones", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 150, null: false
    t.string "siglas", limit: 30, default: "N/A"
    t.string "telefono", limit: 30, default: "N/A"
    t.string "direccion", limit: 300, null: false
    t.string "correo_electronico", limit: 60, default: "N/A"
    t.string "sitio_web", limit: 300, default: "N/A"
    t.integer "id_status", default: 1
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "instituciones_created_at"
    t.index ["id"], name: "id_instituciones_UNIQUE", unique: true
    t.index ["id_status"], name: "instituciones_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "investigaciones", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_instituto", null: false
    t.integer "id_microcuenca", null: false
    t.integer "id_municipio"
    t.integer "id_documento", null: false
    t.string "autor", limit: 200, null: false
    t.string "titulo", limit: 300, null: false
    t.integer "no_paginas", null: false
    t.date "fecha_realizacion"
    t.date "fecha_publicacion"
    t.text "resumen", null: false
    t.string "palabras_clave", limit: 300, null: false
    t.text "recurso_web"
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "investigaciones_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_documento"], name: "fk12_idx"
    t.index ["id_instituto"], name: "fk9_idx"
    t.index ["id_microcuenca"], name: "fk10_idx"
    t.index ["id_municipio"], name: "fk11_idx"
    t.index ["id_status"], name: "investigaciones_status_idx"
  end

  create_table "microcuenca", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_subcuenca", null: false
    t.string "nombre", limit: 100, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "rios_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_status"], name: "rios_status_idx"
    t.index ["id_subcuenca"], name: "fk8_idx"
  end

  create_table "municipios", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_departamento", null: false
    t.string "nombre", limit: 45, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["created_at"], name: "municipios_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_departamento"], name: "fk6_idx"
    t.index ["id_status"], name: "municipios_status_idx"
  end

  create_table "proyecto_area", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_proyecto", null: false
    t.integer "id_area", null: false
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "proyecto_area_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_area", "id_proyecto"], name: "fk2_idx"
    t.index ["id_proyecto"], name: "fk1_idx"
  end

  create_table "proyecto_programa", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_instituto", null: false
    t.string "nombre", limit: 200, null: false
    t.string "descripcion", limit: 600, default: "N/A"
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "proyecto_programa_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_instituto"], name: "fkins_idx"
    t.index ["id_status"], name: "proyecto_programa_status_idx"
  end

  create_table "status", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.integer "visible", limit: 1, null: false
    t.index ["id", "visible"], name: "index2"
  end

  create_table "subcuencas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_cuenca", null: false
    t.string "nombre", limit: 100, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "subcuencas_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_cuenca"], name: "fksc_idx"
    t.index ["id_status"], name: "subcuencas_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "tipo_documento", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 50, null: false
    t.string "descripcion", limit: 500
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "tipo_documento_created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["id_status"], name: "tipo_documento_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "tipo_instituto", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 50, null: false
    t.string "descripcion", limit: 500
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["id"], name: "id_UNIQUE", unique: true
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.integer "id_status"
    t.string "nombre"
    t.string "telefono"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vertientes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre", limit: 100, null: false
    t.integer "id_status"
    t.datetime "updated_at"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["created_at"], name: "vertientes_created_at"
    t.index ["id"], name: "idvertientes_UNIQUE"
    t.index ["id_status"], name: "vertientes_status_idx"
    t.index ["nombre"], name: "nombre_UNIQUE"
  end

  add_foreign_key "area", "status", column: "id_status", name: "area_status"
  add_foreign_key "area_investigacion", "area", column: "id_area", name: "fk13"
  add_foreign_key "area_investigacion", "investigaciones", column: "id_investigacion", name: "fk14"
  add_foreign_key "cuencas", "status", column: "id_status", name: "cuencas_status"
  add_foreign_key "cuencas", "vertientes", column: "id_vertiente", name: "fk7"
  add_foreign_key "departamentos", "status", column: "id_status", name: "departamentos_status"
  add_foreign_key "facultades_institutos", "instituciones", column: "id_instituciones", name: "fk1"
  add_foreign_key "facultades_institutos", "status", column: "id_status", name: "facultades_institutos_status"
  add_foreign_key "facultades_institutos", "tipo_instituto", column: "id_tipo_instituto", name: "fk123"
  add_foreign_key "instituciones", "status", column: "id_status", name: "instituciones_status"
  add_foreign_key "investigaciones", "facultades_institutos", column: "id_instituto", name: "fk9"
  add_foreign_key "investigaciones", "microcuenca", column: "id_microcuenca", name: "fk10"
  add_foreign_key "investigaciones", "municipios", column: "id_municipio", name: "fk11"
  add_foreign_key "investigaciones", "status", column: "id_status", name: "investigaciones_status"
  add_foreign_key "investigaciones", "tipo_documento", column: "id_documento", name: "fk12"
  add_foreign_key "microcuenca", "status", column: "id_status", name: "rios_status"
  add_foreign_key "microcuenca", "subcuencas", column: "id_subcuenca", name: "fkrio"
  add_foreign_key "municipios", "departamentos", column: "id_departamento", name: "fk6"
  add_foreign_key "municipios", "status", column: "id_status", name: "municipios_status"
  add_foreign_key "proyecto_area", "area", column: "id_area", name: "fk3"
  add_foreign_key "proyecto_area", "proyecto_programa", column: "id_proyecto", name: "fk2"
  add_foreign_key "proyecto_programa", "facultades_institutos", column: "id_instituto", name: "fkinst"
  add_foreign_key "proyecto_programa", "status", column: "id_status", name: "proyecto_programa_status"
  add_foreign_key "subcuencas", "cuencas", column: "id_cuenca", name: "fksc"
  add_foreign_key "subcuencas", "status", column: "id_status", name: "subcuencas_status"
  add_foreign_key "tipo_documento", "status", column: "id_status", name: "tipo_documento_status"
  add_foreign_key "vertientes", "status", column: "id_status", name: "vertientes_status"
end
