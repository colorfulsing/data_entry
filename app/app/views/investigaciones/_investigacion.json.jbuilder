json.extract! investigacion, :id, :id_instituto, :id_microcuenca, :id_municipio, :id_documento, :autor, :titulo, :no_paginas, :fecha_realizacion, :fecha_publicacion, :resumen, :palabras_clave, :recurso_web, :id_status, :created_at, :updated_at
json.url investigacion_url(investigacion, format: :json)
