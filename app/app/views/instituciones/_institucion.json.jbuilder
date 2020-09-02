json.extract! institucion, :id, :nombre, :siglas, :telefono, :direccion, :correo_electronico, :sitio_web, :id_status, :created_at, :updated_at
json.url institucion_url(institucion, format: :json)
