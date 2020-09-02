json.array! @collection do |facultad|
  json.extract! facultad,
                :id,
                :nombre
  json.data [
    {key: 'institucion', value: facultad.institucion.try(:vertiente).try(:nombre)},
    {key: 'direccion', value: facultad.direccion}
  ]
end
