json.array! @collection do |municipio|
  json.extract! municipio,
                :id,
                :nombre
  json.data [
    {key: 'departamento', value: municipio.departamento.try(:nombre)}
  ]
end
