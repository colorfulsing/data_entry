json.extract! tipo_documento, :id, :nombre, :descripcion, :id_status, :created_at, :updated_at
json.url tipo_documento_url(tipo_documento, format: :json)
